module Api
  class IndicatorResource < JSONAPI::Resource
    caching

    attributes :title, :summary, :content, :published, :created_at, :updated_at

    filters :title, :published

    has_many :widgets
  end
end
