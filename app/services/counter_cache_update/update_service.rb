class CounterCacheUpdate::UpdateService < ServicePattern::Service
  attr_reader :use_progress_bar

  def initialize(use_progress_bar: false)
    @use_progress_bar = use_progress_bar
  end

  def execute
    Rails.application.eager_load!

    if use_progress_bar
      require "progress_bar"
      @progress_bar = ProgressBar.new(model_classes.size)
    end

    update_relationships!
    ServicePattern::Response.new(success: true)
  end

private

  def update_relationships!
    model_classes.each do |model_class|
      @progress_bar&.increment!

      model_class.reflections.each do |_name, reflection|
        next unless reflection.macro.to_sym == :belongs_to
        next unless reflection.options[:counter_cache]

        if reflection.options[:polymorphic]
          CounterCacheUpdate::PolymorphicUpdatorService.execute!(reflection: reflection)
        else
          CounterCacheUpdate::TableUpdatorService.execute!(reflection: reflection)
        end
      end
    end
  end

  def model_classes
    @model_classes ||= ActiveRecord::Base.descendants
  end
end
