class Api::PartnerSerializer < ActiveModel::Serializer

  attributes :id, :name, :url, :logo, :contact_name, :contact_email

end
