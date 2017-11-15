class Api::ResourceSerializer < ActiveModel::Serializer
  attributes :id, :title, :slug, :description, :url, :photo, :resource_type, :published

  def photo
    {
        thumb: object.photo.url(:thumb),
        medium: object.photo.url(:medium),
        original: object.photo.url(:original)
    }
  end
end
