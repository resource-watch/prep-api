class Api::ToolSerializer < ActiveModel::Serializer

  attributes :id, :title, :summary, :url, :attribution, :images

  belongs_to :partner, serializer: Api::PartnerSerializer

  def images
    {
      thumbnail: object.thumbnail.url(:large),
      logo: object.logo.url(:medium),
      white_logo: object.white_logo.url(:medium)
    }
  end

end
