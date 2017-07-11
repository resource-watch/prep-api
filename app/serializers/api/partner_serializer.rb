class Api::PartnerSerializer < ActiveModel::Serializer

  attributes :id, :name, :partner_type, :description, :content, :url, :images, :contact_name, :contact_email, :featured, :published

  def images
    {
      thumbnail: object.thumbnail.url(:large),
      logo: object.logo.url(:medium),
      white_logo: object.white_logo.url(:medium)
    }
  end

end
