require 'rails_helper'

RSpec.describe "Widgets", type: :request do
  describe "POST /api/widgets" do
    it "creates a new widget with valid json" do
      partner = Partner.create(name: 'Partner test')
      widget_type = WidgetType.create(name: 'Widget Type')

      post "/api/widgets?data[type]=widgets&data[attributes][title]=Widget test&data[attributes][partner-id]=#{partner.id}&data[attributes][widget-type-id]=#{widget_type.id}",
            headers: { "CONTENT_TYPE": "application/vnd.api+json" }

      expect(response).to have_http_status(201)
    end

    it "throws error with invalid json" do
      post '/api/widgets?data[type]=widgets&data[attributes][name]=Widget test',
            headers: { "CONTENT_TYPE": "application/vnd.api+json" }

      expect(response).to have_http_status(400)
    end
  end

  describe "GET /api/widgets" do
    it "lists widgets" do
      partner = Partner.create(name: 'Partner test')
      widget_type = WidgetType.create(name: 'Widget Type')
      Widget.create(title: "Widget test", partner: partner, widget_type: widget_type)

      get api_widgets_path

      expect(JSON.parse(response.body)['meta']['record-count']).to be(1)
      expect(response).to have_http_status(200)
    end

    it "accepts pagination" do
      partner = Partner.create(name: 'Partner test')
      widget_type = WidgetType.create(name: 'Widget Type')
      3.times { Widget.create(title: "Widget test", partner: partner, widget_type: widget_type) }

      get api_widgets_path, params: { "page[size]": 2, "page[number]": 2 }

      expect(JSON.parse(response.body)['meta']['record-count']).to be(3)
      expect(JSON.parse(response.body)['meta']['page-count']).to be(2)
      expect(JSON.parse(response.body)['data'].size).to be(1)
      expect(response).to have_http_status(200)
    end
  end

  describe "GET /api/widgets/:id" do
    it "shows details of one widget" do
      partner = Partner.create(name: 'Partner test')
      widget_type = WidgetType.create(name: 'Widget Type')
      widget = Widget.create(title: "Widget test", partner: partner, widget_type: widget_type)

      get "/api/widgets/#{widget.id}"

      expect(JSON.parse(response.body)['data']['id'].to_i).to eq(widget.id)
      expect(response).to have_http_status(200)
    end
  end

  describe "PUT /api/widgets/:id" do
    it "updates the record with valid json" do
      partner = Partner.create(name: 'Partner test')
      widget_type = WidgetType.create(name: 'Widget Type')
      widget = Widget.create(title: "Widget test", partner: partner, widget_type: widget_type)

      put "/api/widgets/#{widget.id}?data[id]=#{widget.id}&data[type]=widgets&data[attributes][title]=Updated title",
          headers: { "CONTENT_TYPE": "application/vnd.api+json" }

      expect(JSON.parse(response.body)['data']['attributes']['title']).to eq('Updated title')
      expect(response).to have_http_status(200)
    end

    it "throws error with invalid json" do
      partner = Partner.create(name: 'Partner test')
      widget_type = WidgetType.create(name: 'Widget Type')
      widget = Widget.create(title: "Widget test", partner: partner, widget_type: widget_type)

      put "/api/widgets/#{widget.id}?data[id]=#{widget.id}&data[type]=widgets&data[attributes][name]=Updated title",
            headers: { "CONTENT_TYPE": "application/vnd.api+json" }

      expect(response).to have_http_status(400)
    end
  end

  describe "DELETE /api/widgets/:id" do
    it "deletes the widget" do
      partner = Partner.create(name: 'Partner test')
      widget_type = WidgetType.create(name: 'Widget Type')
      widget = Widget.create(title: "Widget test", partner: partner, widget_type: widget_type)
      
      delete "/api/widgets/#{widget.id}"

      expect(response).to have_http_status(204)
    end
  end
end
