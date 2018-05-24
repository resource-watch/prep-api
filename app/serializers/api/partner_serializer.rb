class Api::PartnerSerializer < ActiveModel::Serializer

  attributes :id, :name, :partner_type, :description, :content, :production, :preproduction, :staging,
             :url, :contact_name, :contact_email, :featured, :published, :thumbnail, :logo, :white_logo, :images

  # Support for old site
  def images
    {
      thumbnail: object.thumbnail.url(:large),
      logo: object.logo.url(:medium),
      white_logo: object.white_logo.url(:medium)
    }
  end

end
