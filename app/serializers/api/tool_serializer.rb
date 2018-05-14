class Api::ToolSerializer < ActiveModel::Serializer

  attributes :id, :title, :summary, :url, :attribution, :published, :production, :preproduction, :staging

  belongs_to :partner, serializer: Api::PartnerSerializer

end
