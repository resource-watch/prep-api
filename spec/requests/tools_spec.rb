require 'rails_helper'

RSpec.describe "Tools", type: :request do
  describe "POST /api/tools" do
    it "creates a new tool with valid json" do
      post '/api/tools?data[type]=tools&data[attributes][title]=Tool test',
            headers: { "CONTENT_TYPE": "application/vnd.api+json" }

      expect(response).to have_http_status(201)
    end

    it "throws error with invalid json" do
      post '/api/tools?data[type]=tools&data[attributes][name]=Tool test',
            headers: { "CONTENT_TYPE": "application/vnd.api+json" }

      expect(response).to have_http_status(400)
    end
  end

  describe "GET /api/tools" do
    it "lists tools" do
      Tool.create(title: "Tool test")
      get api_tools_path

      expect(JSON.parse(response.body)['meta']['record-count']).to be(1)
      expect(response).to have_http_status(200)
    end

    it "accepts pagination" do
      3.times { Tool.create(title: "Tool test") }
      get api_tools_path, params: { "page[size]": 2, "page[number]": 2 }

      expect(JSON.parse(response.body)['meta']['record-count']).to be(3)
      expect(JSON.parse(response.body)['meta']['page-count']).to be(2)
      expect(JSON.parse(response.body)['data'].size).to be(1)
      expect(response).to have_http_status(200)
    end
  end

  describe "GET /api/tools/:id" do
    it "shows details of one tool" do
      tool = Tool.create(title: "Tool test")
      get "/api/tools/#{tool.id}"

      expect(JSON.parse(response.body)['data']['id'].to_i).to eq(tool.id)
      expect(response).to have_http_status(200)
    end
  end

  describe "PUT /api/tools/:id" do
    it "updates the record with valid json" do
      tool = Tool.create(title: "Tool test")
      put "/api/tools/#{tool.id}?data[id]=#{tool.id}&data[type]=tools&data[attributes][title]=Updated title",
          headers: { "CONTENT_TYPE": "application/vnd.api+json" }

      expect(JSON.parse(response.body)['data']['attributes']['title']).to eq('Updated title')
      expect(response).to have_http_status(200)
    end

    it "throws error with invalid json" do
      tool = Tool.create(title: "Tool test")
      put "/api/tools/#{tool.id}?data[id]=#{tool.id}&data[type]=tools&data[attributes][name]=Updated title",
            headers: { "CONTENT_TYPE": "application/vnd.api+json" }

      expect(response).to have_http_status(400)
    end
  end

  describe "DELETE /api/tools/:id" do
    it "deletes the tool" do
      tool = Tool.create(title: "Tool test")
      delete "/api/tools/#{tool.id}"

      expect(response).to have_http_status(204)
    end
  end
end
