require "rails_helper"

RSpec.describe "Api::Projects", type: :request do
  describe "GET /index" do
    it "should return http success" do
      get "/api/projects"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /show" do
    it "should return http success" do
      create(:project, name: "Test123")
      get "/api/projects/1"
      expect(response).to have_http_status(:success)
      body = @response.parsed_body
      expect(body["name"]).to eq("Test123")
    end
  end

  describe "GET /show/todos" do
    it "should return http success and the todos of that project" do
      create(:project)
      create(:todo_item, { project_id: 1 })
      get "/api/projects/1/todos"
      expect(response).to have_http_status(:success)
      # wanna make sure the todos were returned
      body = @response.parsed_body
      expect(body[0]["title"]).to eq("TodoTitle")
    end
  end

  describe "POST /create" do
    it "should return http success" do
      post "/api/projects", params: { project: { name: "Test123" } }
      expect(response).to have_http_status(:success)
      # wanna make sure the project was returned
      body = @response.parsed_body
      expect(body["name"]).to eq("Test123")
    end
  end

  describe "PUT /update" do
    it "should return http success with the updated project" do
      create(:project)
      existing_project = Project.find(1)
      expect(existing_project.name).to eq("ProjectName")
      put "/api/projects/1", params: { project: { name: "Test" } }
      expect(response).to have_http_status(:success)
      # wanna make sure the project was returned
      body = @response.parsed_body
      expect(body["name"]).to eq("Test")
    end
  end
end
