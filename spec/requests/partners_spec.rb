require 'rails_helper'

RSpec.describe "Partners", type: :request do
  describe "POST /api/partners" do
    it "creates a new partner with valid json" do
      post '/api/partners?data[type]=partners&data[attributes][name]=Partner test',
            headers: { "CONTENT_TYPE": "application/vnd.api+json" }

      expect(response).to have_http_status(201)
    end

    it "throws error with invalid json" do
      post '/api/partners?data[type]=partners&data[attributes][title]=Partner test',
            headers: { "CONTENT_TYPE": "application/vnd.api+json" }

      expect(response).to have_http_status(400)
    end
  end

  describe "GET /api/partners" do
    it "lists partners" do
      Partner.create(name: "Partner test")
      get api_partners_path

      expect(JSON.parse(response.body)['meta']['record-count']).to be(1)
      expect(response).to have_http_status(200)
    end

    it "accepts pagination" do
      3.times { Partner.create(name: "Partner test") }
      get api_partners_path, params: { "page[size]": 2, "page[number]": 2 }

      expect(JSON.parse(response.body)['meta']['record-count']).to be(3)
      expect(JSON.parse(response.body)['meta']['page-count']).to be(2)
      expect(JSON.parse(response.body)['data'].size).to be(1)
      expect(response).to have_http_status(200)
    end
  end

  describe "GET /api/partners/:id" do
    it "shows details of one partner" do
      partner = Partner.create(name: "Partner test")
      get "/api/partners/#{partner.id}"

      expect(JSON.parse(response.body)['data']['id'].to_i).to eq(partner.id)
      expect(response).to have_http_status(200)
    end
  end

  describe "PUT /api/partners/:id" do
    it "updates the record with valid json" do
      partner = Partner.create(name: "Partner test")
      put "/api/partners/#{partner.id}?data[id]=#{partner.id}&data[type]=partners&data[attributes][name]=Updated name",
          headers: { "CONTENT_TYPE": "application/vnd.api+json" }

      expect(JSON.parse(response.body)['data']['attributes']['name']).to eq('Updated name')
      expect(response).to have_http_status(200)
    end

    it "throws error with invalid json" do
      partner = Partner.create(name: "Partner test")
      put "/api/partners/#{partner.id}?data[id]=#{partner.id}&data[type]=partners&data[attributes][title]=Updated name",
            headers: { "CONTENT_TYPE": "application/vnd.api+json" }

      expect(response).to have_http_status(400)
    end
  end

  describe "DELETE /api/partners/:id" do
    it "deletes the partner" do
      partner = Partner.create(name: "Partner test")
      delete "/api/partners/#{partner.id}"

      expect(response).to have_http_status(204)
    end
  end
end
