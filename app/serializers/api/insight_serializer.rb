class Api::InsightSerializer < ActiveModel::Serializer

  attributes :id, :slug, :title, :summary, :image, :content, :content_url

  belongs_to :partner, serializer: Api::PartnerSerializer

end
