require 'rails_helper'

RSpec.describe "Insights", type: :request do
  describe "POST /api/insights" do
    it "creates a new insight with valid json" do
      post '/api/insights?data[type]=insights&data[attributes][title]=Insight test',
            headers: { "CONTENT_TYPE": "application/vnd.api+json" }

      expect(response).to have_http_status(201)
    end

    it "throws error with invalid json" do
      post '/api/insights?data[type]=insights&data[attributes][name]=Insight test',
            headers: { "CONTENT_TYPE": "application/vnd.api+json" }

      expect(response).to have_http_status(400)
    end
  end

  describe "GET /api/insights" do
    it "lists insights" do
      Insight.create(title: "Insight test")
      get api_insights_path

      expect(JSON.parse(response.body)['meta']['record-count']).to be(1)
      expect(response).to have_http_status(200)
    end

    it "accepts pagination" do
      3.times { Insight.create(title: "Insight test") }
      get api_insights_path, params: { "page[size]": 2, "page[number]": 2 }

      expect(JSON.parse(response.body)['meta']['record-count']).to be(3)
      expect(JSON.parse(response.body)['meta']['page-count']).to be(2)
      expect(JSON.parse(response.body)['data'].size).to be(1)
      expect(response).to have_http_status(200)
    end
  end

  describe "GET /api/insights/:id" do
    it "shows details of one insight" do
      insight = Insight.create(title: "Insight test")
      get "/api/insights/#{insight.id}"

      expect(JSON.parse(response.body)['data']['id'].to_i).to eq(insight.id)
      expect(response).to have_http_status(200)
    end
  end

  describe "PUT /api/insights/:id" do
    it "updates the record with valid json" do
      insight = Insight.create(title: "Insight test")
      put "/api/insights/#{insight.id}?data[id]=#{insight.id}&data[type]=insights&data[attributes][title]=Updated title",
          headers: { "CONTENT_TYPE": "application/vnd.api+json" }

      expect(JSON.parse(response.body)['data']['attributes']['title']).to eq('Updated title')
      expect(response).to have_http_status(200)
    end

    it "throws error with invalid json" do
      insight = Insight.create(title: "Insight test")
      put "/api/insights/#{insight.id}?data[id]=#{insight.id}&data[type]=insights&data[attributes][name]=Updated title",
            headers: { "CONTENT_TYPE": "application/vnd.api+json" }

      expect(response).to have_http_status(400)
    end
  end

  describe "DELETE /api/insights/:id" do
    it "deletes the insight" do
      insight = Insight.create(title: "Insight test")
      delete "/api/insights/#{insight.id}"

      expect(response).to have_http_status(204)
    end
  end
end
