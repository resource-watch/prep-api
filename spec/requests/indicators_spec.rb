require 'rails_helper'

RSpec.describe "Indicators", type: :request do
  describe "POST /api/indicators" do
    it "creates a new indicator with valid json" do
      post '/api/indicators?data[type]=indicators&data[attributes][title]=Indicator test',
            headers: { "CONTENT_TYPE": "application/vnd.api+json" }

      expect(response).to have_http_status(201)
    end

    it "throws error with invalid json" do
      post '/api/indicators?data[type]=indicators&data[attributes][name]=Indicator test',
            headers: { "CONTENT_TYPE": "application/vnd.api+json" }

      expect(response).to have_http_status(400)
    end
  end

  describe "GET /api/indicators" do
    it "lists indicators" do
      Indicator.create(title: "Indicator test")
      get api_indicators_path

      expect(JSON.parse(response.body)['meta']['record-count']).to be(1)
      expect(response).to have_http_status(200)
    end

    it "accepts pagination" do
      3.times { Indicator.create(title: "Indicator test") }
      get api_indicators_path, params: { "page[size]": 2, "page[number]": 2 }

      expect(JSON.parse(response.body)['meta']['record-count']).to be(3)
      expect(JSON.parse(response.body)['meta']['page-count']).to be(2)
      expect(JSON.parse(response.body)['data'].size).to be(1)
      expect(response).to have_http_status(200)
    end
  end

  describe "GET /api/indicators/:id" do
    it "shows details of one indicator" do
      indicator = Indicator.create(title: "Indicator test")
      get "/api/indicators/#{indicator.id}"

      expect(JSON.parse(response.body)['data']['id'].to_i).to eq(indicator.id)
      expect(response).to have_http_status(200)
    end
  end

  describe "PUT /api/indicators/:id" do
    it "updates the record with valid json" do
      indicator = Indicator.create(title: "Indicator test")
      put "/api/indicators/#{indicator.id}?data[id]=#{indicator.id}&data[type]=indicators&data[attributes][title]=Updated title",
          headers: { "CONTENT_TYPE": "application/vnd.api+json" }

      expect(JSON.parse(response.body)['data']['attributes']['title']).to eq('Updated title')
      expect(response).to have_http_status(200)
    end

    it "throws error with invalid json" do
      indicator = Indicator.create(title: "Indicator test")
      put "/api/indicators/#{indicator.id}?data[id]=#{indicator.id}&data[type]=indicators&data[attributes][name]=Updated title",
            headers: { "CONTENT_TYPE": "application/vnd.api+json" }

      expect(response).to have_http_status(400)
    end
  end

  describe "DELETE /api/indicators/:id" do
    it "deletes the indicator" do
      indicator = Indicator.create(title: "Indicator test")
      delete "/api/indicators/#{indicator.id}"

      expect(response).to have_http_status(204)
    end
  end
end
