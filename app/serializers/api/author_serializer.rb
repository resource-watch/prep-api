class Api::AuthorSerializer < ActiveModel::Serializer

  attributes :id, :name, :url, :contact_name, :contact_email, :thumbnail, :logo, :white_logo, :images

  # Support for old site
  def images
    {
      thumbnail: object.thumbnail.url(:large),
      logo: object.logo.url(:medium),
      white_logo: object.white_logo.url(:medium)
    }
  end

end
