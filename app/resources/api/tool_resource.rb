module Api
  class ToolResource < JSONAPI::Resource
    caching

    attributes :title, :summary, :url, :attribution, :published, :partner_id, :created_at, :updated_at

    filters :title, :url, :published, :partner_id

    has_one :partner
  end
end
