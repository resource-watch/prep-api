class Api::ToolSerializer < ActiveModel::Serializer

  attributes :id, :title, :summary, :url, :attribution, :published

  belongs_to :partner, serializer: Api::PartnerSerializer

end
