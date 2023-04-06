require "rails_helper"

RSpec.describe Project, type: :model do
  it "validates name" do
    project = create(:project)
    expect(project.valid?).to eq(true)
  end

  it "should delete associated todos when deleted" do
    project = create(:project)
    project.todo_items.create(title: "Test", description: "Test")
    expect { project.destroy }.to change { TodoItem.count }.by(-1)
  end
end
