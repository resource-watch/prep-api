class Api::DashboardDetailSerializer < ActiveModel::Serializer
  attributes :id, :title, :slug, :summary, :image, :content

  has_one :indicator
  has_one :partner, serializer: Api::PartnerSerializer
end
