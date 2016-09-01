class Api::PartnerSerializer < ActiveModel::Serializer

  attributes :id, :name, :description, :url, :logo, :white_logo, :logo_large, :logo_medium,
    :white_logo_medium, :logo_size, :contact_name, :contact_email

  def logo_size
    dimensions = (object.logo_dimensions || '0x0').split('x')
    { width: dimensions[0].to_i, height: dimensions[1].to_i}
  end

  def logo_large
    object.logo.url(:large)
  end

  def logo_medium
    object.logo.url(:medium)
  end

  def white_logo_medium
    object.white_logo.url(:medium)
  end

end
