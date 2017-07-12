class Api::PartnerSerializer < ActiveModel::Serializer

  attributes :id, :name, :partner_type, :description, :content,
             :url, :contact_name, :contact_email, :featured, :published, :thumbnail, :logo, :white_logo

end
