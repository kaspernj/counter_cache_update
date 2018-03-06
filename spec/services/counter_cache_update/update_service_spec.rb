require "rails_helper"

describe CounterCacheUpdate::UpdateService do
  let!(:project) { create :project }
  let!(:task) { create :task, project: project }

  describe "#execute!" do
    it "updates the cache" do
      expect(project.tasks_count).to eq 1

      Project.connection.execute("UPDATE projects SET tasks_count = 0 WHERE id = '#{project.id}'")

      expect(project.reload.tasks_count).to eq 0

      CounterCacheUpdate::UpdateService.execute!

      expect(project.reload.tasks_count).to eq 1
    end
  end
end
