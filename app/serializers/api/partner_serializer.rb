class Api::PartnerSerializer < ActiveModel::Serializer

  attributes :id, :name, :url, :logo, :logo_dimensions, :contact_name, :contact_email

end
