class Api::InsightSerializer < ActiveModel::Serializer

  attributes :id, :slug, :title, :template_type, :summary, :image, :content, :embeddable, :content_url, :attribution, :published, :production, :preproduction, :staging

  belongs_to :partner, serializer: Api::PartnerSerializer

end
