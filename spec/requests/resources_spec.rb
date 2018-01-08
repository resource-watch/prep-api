require 'rails_helper'

RSpec.describe "Resources", type: :request do
  describe "POST /api/resources" do
    it "creates a new resource with valid json" do
      post '/api/resources?data[type]=resources&data[attributes][title]=Resource test&data[attributes][resource-type]=Climate Data Portals',
            headers: { "CONTENT_TYPE": "application/vnd.api+json" }

      expect(response).to have_http_status(201)
    end

    it "throws error with invalid json" do
      post '/api/resources?data[type]=resources&data[attributes][name]=Resource test&data[attributes][resource-type]=Climate Data Portals',
            headers: { "CONTENT_TYPE": "application/vnd.api+json" }

      expect(response).to have_http_status(400)
    end
  end

  describe "GET /api/resources" do
    it "lists resources" do
      Resource.create(title: "Resource test", resource_type: "Climate Data Portals")
      get api_resources_path

      expect(JSON.parse(response.body)['meta']['record-count']).to be(1)
      expect(response).to have_http_status(200)
    end

    it "accepts pagination" do
      3.times { Resource.create(title: "Resource test", resource_type: "Climate Data Portals") }
      get api_resources_path, params: { "page[size]": 2, "page[number]": 2 }

      expect(JSON.parse(response.body)['meta']['record-count']).to be(3)
      expect(JSON.parse(response.body)['meta']['page-count']).to be(2)
      expect(JSON.parse(response.body)['data'].size).to be(1)
      expect(response).to have_http_status(200)
    end
  end

  describe "GET /api/resources/:id" do
    it "shows details of one resource" do
      resource = Resource.create(title: "Resource test", resource_type: "Climate Data Portals")
      get "/api/resources/#{resource.id}"

      expect(JSON.parse(response.body)['data']['id'].to_i).to eq(resource.id)
      expect(response).to have_http_status(200)
    end
  end

  describe "PUT /api/resources/:id" do
    it "updates the record with valid json" do
      resource = Resource.create(title: "Resource test", resource_type: "Climate Data Portals")
      put "/api/resources/#{resource.id}?data[id]=#{resource.id}&data[type]=resources&data[attributes][title]=Updated title",
          headers: { "CONTENT_TYPE": "application/vnd.api+json" }

      expect(JSON.parse(response.body)['data']['attributes']['title']).to eq('Updated title')
      expect(response).to have_http_status(200)
    end

    it "throws error with invalid json" do
      resource = Resource.create(title: "Resource test", resource_type: "Climate Data Portals")
      put "/api/resources/#{resource.id}?data[id]=#{resource.id}&data[type]=resources&data[attributes][name]=Updated title",
            headers: { "CONTENT_TYPE": "application/vnd.api+json" }

      expect(response).to have_http_status(400)
    end
  end

  describe "DELETE /api/resources/:id" do
    it "deletes the resource" do
      resource = Resource.create(title: "Resource test", resource_type: "Climate Data Portals")
      delete "/api/resources/#{resource.id}"

      expect(response).to have_http_status(204)
    end
  end
end
