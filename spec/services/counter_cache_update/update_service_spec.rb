require "rails_helper"

describe CounterCacheUpdate::UpdateService do
  let!(:project) { create(:project) }
  let!(:task_primary) { create(:task, project: project) }
  let!(:task_secondary) { create(:task, project: project) }
  let!(:task_primary_comment_one) { create(:comment, resource: task_primary) }
  let!(:task_primary_comment_two) { create(:comment, resource: task_primary) }
  let!(:project_comment) { create(:comment, resource: project) }

  describe "#execute!" do
    it "updates the cache" do
      expect(project.tasks_count).to eq 2

      Project.connection.execute("UPDATE projects SET tasks_count = 0 WHERE id = '#{project.id}'")

      expect(project.reload.tasks_count).to eq 0

      CounterCacheUpdate::UpdateService.execute!

      project.reload

      expect(project.comments_count).to eq 1
      expect(project.tasks_count).to eq 2
      expect(task_primary.reload.comments_count).to eq 2
      expect(task_secondary.reload.comments_count).to eq 0
    end
  end
end
