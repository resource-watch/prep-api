class Api::DashboardSerializer < ActiveModel::Serializer
  attributes :id, :title, :slug, :summary, :content, :attribution, :published,
             :user_id, :production, :preproduction, :staging, :tags, :locations

  belongs_to :partner, serializer: Api::PartnerSerializer
  has_one :author, serializer: Api::AuthorSerializer
end
