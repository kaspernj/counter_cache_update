class CounterCacheUpdate::TableUpdatorService < ServicePattern::Service
  attr_reader :model_class, :reflection

  def initialize(reflection:, model_class: nil)
    @reflection = reflection

    @model_class = model_class
    @model_class ||= @reflection.class_name.constantize
  end

  def perform
    model_class.connection.execute(sql)
    succeed!
  end

private

  def column_name
    @column_name ||= proc do
      if reflection.options[:counter_cache] == true
        "#{reflection.active_record.name.pluralize.underscore}_count"
      else
        reflection.options[:counter_cache]
      end
    end.call
  end

  def count_sql
    sql = "SELECT COUNT(*) FROM #{reflection_table_name} WHERE #{reflection_table_name}.#{relation_foreign_key} = #{table_name}.#{primary_key}"
    sql << " AND #{reflection.foreign_type} = #{ActiveRecord::Base.connection.quote(model_class.name)}" if reflection.options[:polymorphic]
    sql
  end

  def primary_key
    model_class.primary_key
  end

  def relation_foreign_key
    reflection.foreign_key
  end

  def reflection_table_name
    reflection.active_record.table_name
  end

  def sql
    "UPDATE #{table_name} SET #{column_name} = (#{count_sql})"
  end

  def table_name
    model_class.table_name
  end
end
