require "rails_helper"

RSpec.describe "api/todos", type: :request do
  describe "GET /todos" do
    it "returns http success" do
      get "/api/todos"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /todos/:id" do
    it "returns http success" do
      create(:todo_item)
      get "/api/todos/1"
      expect(response).to have_http_status(:success)
    end
  end

  describe "POST /todos" do
    it "returns http success" do
      post "/api/todos", params: { todo: { title: "Test", description: "Test" } }
      expect(response).to have_http_status(:success)
    end
  end

  describe "PUT /todos/:id" do
    it "returns http success" do
      create(:todo_item)
      # assert existing todo
      @todo = TodoItem.find(1)
      expect(@todo.title).to eq("TodoTitle")
      put "/api/todos/1", params: { todo: { title: "Test", description: "Test" } }
      expect(response).to have_http_status(:success)
      # assert updated todo
      @todo = TodoItem.find(1)
      expect(@todo.title).to eq("Test")
    end

    it "marks the todo as complete when complete as true" do
      create(:todo_item)
      # assert existing todo
      @todo = TodoItem.find(1)
      expect(@todo.completed_date).to eq(nil)
      put "/api/todos/1", params: { todo: { complete: true } }
      expect(response).to have_http_status(:success)
      # assert updated todo
      @todo = TodoItem.find(1)
      expect(@todo.completed_date).to_not eq(nil)
    end
  end

  describe "DELETE /todos" do
    it "returns http success" do
      create(:todo_item)
      delete "/api/todos/1"
      expect(response).to have_http_status(:success)
    end
  end
end
