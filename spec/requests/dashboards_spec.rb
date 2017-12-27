require 'rails_helper'

RSpec.describe "Dashboards", type: :request do
  describe "POST /api/dashboards" do
    it "creates a new dashboard with valid json" do
      post api_dashboards_path, params: { data: { type: 'dashboards', attributes: { title: "Dashboard test", content: "{}" } } }

      expect(response).to have_http_status(201)
    end

    it "throws error with invalid json" do
      post api_dashboards_path, params: { data: { type: 'dashboards', attributes: { name: "Dashboard test" } } }

      expect(response).to have_http_status(400)
    end
  end

  describe "GET /api/dashboards" do
    it "lists dashboards" do
      Dashboard.create(title: "Dashboard test", content: "{}")
      get api_dashboards_path

      expect(JSON.parse(response.body)['meta']['record-count']).to be(1)
      expect(response).to have_http_status(200)
    end

    it "accepts pagination" do
      3.times { Dashboard.create(title: "Dashboard test", content: "{}") }
      get api_dashboards_path, params: { "page[size]": 2, "page[number]": 2 }

      expect(JSON.parse(response.body)['meta']['record-count']).to be(3)
      expect(JSON.parse(response.body)['meta']['page-count']).to be(2)
      expect(JSON.parse(response.body)['data'].size).to be(1)
      expect(response).to have_http_status(200)
    end
  end

  describe "GET /api/dashboards/:id" do
    it "shows details of one dashboard" do
      dashboard = Dashboard.create(title: "Dashboard test", content: "{}")
      get "/api/dashboards/#{dashboard.id}"

      expect(JSON.parse(response.body)['data']['id'].to_i).to eq(dashboard.id)
      expect(response).to have_http_status(200)
    end
  end

  describe "PUT /api/dashboards/:id" do
    it "updates the record with valid json" do
      dashboard = Dashboard.create(title: "Dashboard test", content: "{}")
      put "/api/dashboards/#{dashboard.id}", params: { data: { id: dashboard.id, type: 'dashboards', attributes: { title: "Updated title", content: "{}" } } }

      expect(JSON.parse(response.body)['data']['attributes']['title']).to eq('Updated title')
      expect(response).to have_http_status(200)
    end

    it "throws error with invalid json" do
      dashboard = Dashboard.create(title: "Dashboard test", content: "{}")
      put "/api/dashboards/#{dashboard.id}", params: { data: { id: dashboard.id, type: 'dashboards', attributes: { name: "Updated title" } } }

      expect(response).to have_http_status(400)
    end
  end

  describe "DELETE /api/dashboards/:id" do
    it "deletes the dashboard" do
      dashboard = Dashboard.create(title: "Dashboard test", content: "{}")
      delete "/api/dashboards/#{dashboard.id}"

      expect(response).to have_http_status(204)
    end
  end
end
