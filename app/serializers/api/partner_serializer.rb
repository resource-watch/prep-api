class Api::PartnerSerializer < ActiveModel::Serializer

  attributes :id, :name, :url, :logo, :logo_size, :contact_name, :contact_email

  def logo_size
    dimensions = object.logo_dimensions.split('x')
    { width: dimensions[0].to_i, height: dimensions[1].to_i}
  end

end
