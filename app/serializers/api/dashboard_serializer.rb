class Api::DashboardSerializer < ActiveModel::Serializer
  attributes :id, :title, :slug, :summary, :image, :content

  has_many :dataset
end
