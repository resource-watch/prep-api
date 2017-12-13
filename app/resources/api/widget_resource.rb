module Api
  class WidgetResource < JSONAPI::Resource
    caching

    attributes :title, :summary, :slug, :data_url, :content, :widget_config,
               :published, :partner_id, :created_at, :updated_at, :dataset,
               :visualization, :widget_type_id, :attribution

    filters :title, :slug, :data_url, :published, :partner_id, :visualization, :widget_type_id

    has_one :partner
    has_one :widget_type
  end
end
