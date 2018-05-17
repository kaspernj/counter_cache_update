require "rails_helper"

describe CounterCacheUpdate::UpdateService do
  let!(:comment1) { create :comment, resource: task1 }
  let!(:comment2) { create :comment, resource: task1 }
  let!(:comment3) { create :comment, resource: project }
  let!(:project) { create :project }
  let!(:task1) { create :task, project: project }
  let!(:task2) { create :task, project: project }

  describe "#execute!" do
    it "updates the cache" do
      expect(project.tasks_count).to eq 2

      Project.connection.execute("UPDATE projects SET tasks_count = 0 WHERE id = '#{project.id}'")

      expect(project.reload.tasks_count).to eq 0

      CounterCacheUpdate::UpdateService.execute!

      project.reload

      expect(project.comments_count).to eq 1
      expect(project.tasks_count).to eq 2
      expect(task1.reload.comments_count).to eq 2
      expect(task2.reload.comments_count).to eq 0
    end
  end
end
