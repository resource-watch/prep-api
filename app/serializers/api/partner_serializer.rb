class Api::PartnerSerializer < ActiveModel::Serializer

  attributes :id, :name, :description, :url, :images, :contact_name, :contact_email

  def images
    {
      thumbnail: object.thumbnail.url(:medium),
      logo: object.logo.url(:medium),
      white_logo: object.white_logo.url(:medium)
    }
  end

end
