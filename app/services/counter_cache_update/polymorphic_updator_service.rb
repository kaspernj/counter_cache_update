class CounterCacheUpdate::PolymorphicUpdatorService < ServicePattern::Service
  def initialize(reflection:)
    @class = reflection.active_record
    @reflection = reflection
  end

  def execute!
    foreign_types.each do |foreign_type|
      CounterCacheUpdate::TableUpdatorService.execute!(reflection: @reflection, model_class: foreign_type.constantize)
    end
  end

private

  # Returns the class names of those records that has the given polymorphic relationship
  def foreign_types
    @reflection.active_record
      .group(@reflection.foreign_type)
      .pluck(@reflection.foreign_type)
  end
end
