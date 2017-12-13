module Api
  class DashboardResource < JSONAPI::Resource
    caching
    
    attributes :title, :slug, :summary, :content, :image, :published, :partner_id,
               :indicator_id, :related_datasets, :attribution, :created_at, :updated_at

    filters :title, :slug, :published, :partner_id, :indicator_id

    has_one :partner
    has_one :indicator
    has_many :dashboards
    has_many :insights
    has_many :tools
  end
end
