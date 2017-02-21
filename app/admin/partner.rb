ActiveAdmin.register Partner do

  index do
    selectable_column
    id_column
    column :name
    column :url
    column :contact_name
    column :contact_email
    column :featured
    column :published
    actions
  end

  permit_params :name, :description, :url, :thumbnail, :logo, :white_logo, :contact_name, :contact_email, :featured, :published, :content, :partner_type

  form do |f|
    f.semantic_errors
    f.inputs "Partner Details" do
      f.input :name, required: true
      f.input :partner_type, as: :select, collection: ['partner', 'founding partner'], required: true
      f.input :description
      f.input :content
      f.input :url
      f.input :contact_name
      f.input :contact_email
      f.input :thumbnail, as: :file, :hint => defined?(f.object.thumbnail) && f.object.thumbnail.present? \
        ? image_tag(f.object.thumbnail.url(:thumb))
        : content_tag(:span, "no partner image uploaded yet")
      f.input :logo, as: :file, :hint => defined?(f.object.logo) && f.object.logo.present? \
        ? image_tag(f.object.logo.url(:thumb))
        : content_tag(:span, "no partner image uploaded yet")
      f.input :white_logo, as: :file, :hint => defined?(f.object.white_logo) && f.object.white_logo.present? \
        ? image_tag(f.object.white_logo.url(:thumb))
        : content_tag(:span, "no white partner image uploaded yet")
      f.input :featured, as: :boolean
      f.input :published, as: :boolean
    end
    f.actions
  end

end
