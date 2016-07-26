class Api::WidgetSerializer < ActiveModel::Serializer
  attributes :id, :title, :summary, :slug, :content, :data_url, :json_spec

  belongs_to :partner, serializer: Api::PartnerSerializer
end
