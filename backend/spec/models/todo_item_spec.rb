require "rails_helper"

RSpec.describe TodoItem, type: :model do
  it "validates title" do
    todo_item = TodoItem.new(title: "Test")
    expect(todo_item.valid?).to eq(true)
  end

  it "marks completed_date when mark_complete! is called" do
    todo_item = TodoItem.new(title: "Test")
    todo_item.mark_complete!
    expect(todo_item.completed_date).to_not eq(nil)
  end

  it "marks completed_date as nil when incomplete! is called" do
    todo_item = TodoItem.new(title: "Test", completed_date: Time.now)
    todo_item.mark_incomplete!
    expect(todo_item.completed_date).to eq(nil)
  end

  it "is_complete? when completed_date is not nil" do
    todo_item = TodoItem.new(completed_date: Time.now)
    expect(todo_item.is_complete?).to eq(true)
  end

  it "is not complete when completed_date is nil" do
    todo_item = TodoItem.new(completed_date: nil)
    expect(todo_item.is_complete?).to eq(false)
  end
end
