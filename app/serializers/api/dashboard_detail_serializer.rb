class Api::DashboardDetailSerializer < ActiveModel::Serializer
  attributes :id, :title, :slug, :summary, :image, :content

  has_one :indicator, serializer: Api::IndicatorSerializer
  has_many :insights
  has_many :tools
  has_one :partner, serializer: Api::PartnerSerializer
end
