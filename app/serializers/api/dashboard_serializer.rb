class Api::DashboardSerializer < ActiveModel::Serializer
  attributes :id, :title, :slug, :summary, :content, :attribution

  belongs_to :partner, serializer: Api::PartnerSerializer
end
