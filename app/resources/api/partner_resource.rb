module Api
  class PartnerResource < JSONAPI::Resource
    caching

    attributes :name, :url, :contact_name, :contact_email, :logo, :published,
               :created_at, :updated_at, :white_logo, :featured, :description,
               :thumbnail, :content, :partner_type

    filters :name, :url, :contact_name, :contact_email, :published, :featured, :partner_type
  end
end
