require 'rails_helper'

RSpec.describe "User Dashboards", type: :request do
  describe "POST /api/user-dashboards" do
    it "creates a new user dashboard with valid json" do
      post '/api/user-dashboards?data[type]=user-dashboards&data[attributes][name]=User Dashboard test',
            headers: { "CONTENT_TYPE": "application/vnd.api+json" }

      expect(response).to have_http_status(201)
    end

    it "throws error with invalid json" do
      post '/api/user-dashboards?data[type]=user-dashboards&data[attributes][title]=User Dashboard test',
            headers: { "CONTENT_TYPE": "application/vnd.api+json" }

      expect(response).to have_http_status(400)
    end
  end

  describe "GET /api/user-dashboards" do
    it "lists user dashboards" do
      UserDashboard.create(name: "User Dashboard test")
      get api_user_dashboards_path

      expect(JSON.parse(response.body)['meta']['record-count']).to be(1)
      expect(response).to have_http_status(200)
    end

    it "accepts pagination" do
      3.times { UserDashboard.create(name: "User Dashboard test") }
      get api_user_dashboards_path, params: { "page[size]": 2, "page[number]": 2 }

      expect(JSON.parse(response.body)['meta']['record-count']).to be(3)
      expect(JSON.parse(response.body)['meta']['page-count']).to be(2)
      expect(JSON.parse(response.body)['data'].size).to be(1)
      expect(response).to have_http_status(200)
    end
  end

  describe "GET /api/user-dashboards/:id" do
    it "shows details of one user dashboard" do
      user_dashboard = UserDashboard.create(name: "User Dashboard test")
      get "/api/user-dashboards/#{user_dashboard.id}"

      expect(JSON.parse(response.body)['data']['id'].to_i).to eq(user_dashboard.id)
      expect(response).to have_http_status(200)
    end
  end

  describe "PUT /api/user-dashboards/:id" do
    it "updates the record with valid json" do
      user_dashboard = UserDashboard.create(name: "User Dashboard test")
      put "/api/user-dashboards/#{user_dashboard.id}?data[id]=#{user_dashboard.id}&data[type]=user-dashboards&data[attributes][name]=Updated name",
          headers: { "CONTENT_TYPE": "application/vnd.api+json" }

      expect(JSON.parse(response.body)['data']['attributes']['name']).to eq('Updated name')
      expect(response).to have_http_status(200)
    end

    it "throws error with invalid json" do
      user_dashboard = UserDashboard.create(name: "User Dashboard test")
      put "/api/user-dashboards/#{user_dashboard.id}?data[id]=#{user_dashboard.id}&data[type]=user-dashboards&data[attributes][title]=Updated name",
            headers: { "CONTENT_TYPE": "application/vnd.api+json" }

      expect(response).to have_http_status(400)
    end
  end

  describe "DELETE /api/user-dashboards/:id" do
    it "deletes the user dashboard" do
      user_dashboard = UserDashboard.create(name: "User Dashboard test")
      delete "/api/user-dashboards/#{user_dashboard.id}"

      expect(response).to have_http_status(204)
    end
  end
end
