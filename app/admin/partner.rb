ActiveAdmin.register Partner do

  permit_params :name, :url, :logo, :published

  form do |f|
    f.semantic_errors
    f.inputs "Partner Details" do
      f.input :name, required: true
      f.input :url
      f.input :contact_name
      f.input :contact_email
      f.input :logo, as: :file, :hint => image_tag(f.object.logo.url(:thumb))
      f.input :published, as: :boolean
    end
    f.actions
  end

end
