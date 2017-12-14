module Api
  class ResourceResource < JSONAPI::Resource
    caching

    attributes :title, :description, :url, :slug, :created_at, :updated_at,
               :photo, :resource_type, :published

    filters :title, :url, :slug, :resource_type, :published

    def photo
      {
        medium: @model.photo.url(:medium),
        thumb: @model.photo.url(:thumb)
      }
    end
  end
end
