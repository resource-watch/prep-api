class Api::DashboardSerializer < ActiveModel::Serializer
  attributes :id, :title, :slug, :summary, :content, :attribution, :published,
             :user_id, :production, :preproduction, :staging, :tags, :locations, :author

  belongs_to :partner, serializer: Api::PartnerSerializer
end
