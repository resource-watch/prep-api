module Api
  class PartnerResource < JSONAPI::Resource
    caching

    attributes :name, :url, :contact_name, :contact_email, :logo, :published,
               :created_at, :updated_at, :white_logo, :featured, :description,
               :thumbnail, :content, :partner_type

    filters :name, :url, :contact_name, :contact_email, :published, :featured, :partner_type

    def thumbnail
      {
        large: @model.thumbnail.url(:large),
        medium: @model.thumbnail.url(:medium),
        thumb: @model.thumbnail.url(:thumb)
      }
    end

    def logo
      {
        medium: @model.logo.url(:medium),
        thumb: @model.logo.url(:thumb)
      }
    end

    def white_logo
      {
        medium: @model.white_logo.url(:medium),
        thumb: @model.white_logo.url(:thumb)
      }
    end
  end
end
