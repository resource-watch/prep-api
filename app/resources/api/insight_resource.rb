module Api
  class InsightResource < JSONAPI::Resource
    caching

    attributes :title, :slug, :summary, :content, :content_url, :image,
               :published, :partner_id, :attribution, :template_type,
               :created_at, :updated_at, :embeddable

    filters :title, :slug, :content_url, :published, :partner_id, :template_type, :embeddable

    has_one :partner
  end
end
