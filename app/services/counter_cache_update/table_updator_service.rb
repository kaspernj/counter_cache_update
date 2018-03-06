class CounterCache::TableUpdatorService < ServicePattern::Service
  attr_reader :model_class, :reflection

  def initialize(reflection:)
    @reflection = reflection
    @model_class = @reflection.class_name.constantize
  end

  def execute!
    model_class.connection.execute(sql)
    ServicePattern::Response.new(success: true)
  end

private

  def column_name
    @_column_name ||= proc do
      if reflection.options[:counter_cache] == true
        "#{reflection.active_record.name.pluralize.underscore}_count"
      else
        reflection.options[:counter_cache]
      end
    end.call
  end

  def count_sql
    "SELECT COUNT(*) FROM #{reflection_table_name} WHERE #{reflection_table_name}.#{reflection_primary_key} = #{table_name}.#{primary_key}"
  end

  def primary_key
    model_class.primary_key
  end

  def reflection_primary_key
    reflection.active_record.primary_key
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
