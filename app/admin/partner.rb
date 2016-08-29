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

  permit_params :name, :description, :url, :logo, :white_logo, :contact_name, :contact_email, :featured, :published

  form do |f|
    f.semantic_errors
    f.inputs "Partner Details" do
      f.input :name, required: true
      f.input :description
      f.input :url
      f.input :contact_name
      f.input :contact_email
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
