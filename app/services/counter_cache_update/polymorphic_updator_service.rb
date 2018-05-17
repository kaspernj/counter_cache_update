class CounterCacheUpdate::PolymorphicUpdatorService < ServicePattern::Service
  def initialize(reflection:)
    @class = reflection.active_record
    @reflection = reflection
  end

  def execute!
    @reflection.active_record.group(@reflection.foreign_type).pluck(@reflection.foreign_type).each do |foreign_type|
      CounterCacheUpdate::TableUpdatorService.execute!(reflection: @reflection, model_class: foreign_type.constantize)
    end
  end
end
