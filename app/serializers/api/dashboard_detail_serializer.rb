class Api::DashboardDetailSerializer < ActiveModel::Serializer
  attributes :id, :title, :slug, :summary, :image, :content

  has_many :dataset, serializer: Api::DatasetDetailSerializer
  has_one :partner, serializer: Api::PartnerSerializer
end
