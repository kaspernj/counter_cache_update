require "rails_helper"

describe CounterCacheUpdate::TableUpdatorService do
  let(:reflection) { Task.reflect_on_association(:project) }
  let(:model_class) { Project }

  def build_service(counter_cache:)
    allow(reflection).to receive(:options).and_return(counter_cache: counter_cache)
    described_class.new(reflection: reflection, model_class: model_class)
  end

  describe "#column_name" do
    it "falls back to the default column when counter_cache is a hash without a column" do
      service = build_service(counter_cache: {active: true, column: nil})

      expect(service.send(:column_name)).to eq("tasks_count")
    end

    it "uses the provided column when counter_cache is a hash with a column" do
      service = build_service(counter_cache: {active: true, column: "comments_count"})

      expect(service.send(:column_name)).to eq("comments_count")
    end
  end
end
