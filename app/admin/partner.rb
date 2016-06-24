ActiveAdmin.register Partner do

  permit_params :name, :url, :logo, :published

  form do |f|
    f.semantic_errors
    f.inputs "Partner Details" do
      f.input :name, required: true
      f.input :url
      f.input :logo, as: :file
      f.input :published, as: :boolean
    end
    f.actions
  end

end
