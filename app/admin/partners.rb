ActiveAdmin.register Partner do
  config.per_page = 20
  config.sort_order = 'created_at_desc'

  filter :name
  filter :url
  filter :contact_name
  filter :contact_email
  filter :description
  filter :content
  filter :partner_type
  filter :published
  filter :featured
  filter :updated_at
  filter :created_at

  controller do
    def permitted_params
      params.permit(:id, partner: [:name, :url, :contact_name, :contact_email,
                                   :published, :featured, :description, :content,
                                   :partner_type, :thumbnail, :logo, :white_logo])
    end
  end

  index do
    column :name
    column :contact_name
    column :url
    column :published
    column :featured
    column :updated_at
    column :created_at
    actions
  end

  form multipart: true do |f|
    f.semantic_errors *f.object.errors.keys
    f.inputs do
      f.input :name
      f.input :url
      f.input :contact_name
      f.input :contact_email
      f.input :published
      f.input :featured
      f.input :description
      f.input :content
      f.input :partner_type, as: :select,
                              collection: Partner.partner_types,
                              include_blank: false
      f.input :thumbnail, as: :file, hint: f.object.thumbnail.present? ? \
        image_tag(f.object.thumbnail.url) : content_tag(:span, 'No image yet')
      f.input :logo, as: :file, hint: f.object.logo.present? ? \
        image_tag(f.object.logo.url) : content_tag(:span, 'No image yet')
      f.input :white_logo, as: :file, hint: f.object.white_logo.present? ? \
        image_tag(f.object.white_logo.url) : content_tag(:span, 'No image yet')
    end
    f.actions
  end

  show do |d|
    attributes_table do
      row :name
      row :url
      row :contact_name
      row :contact_email
      row :published
      row :featured
      row :description
      row :content
      row :partner_type
      row :thumbnail do
        image_tag(d.thumbnail.url(:thumb)) unless d.thumbnail.blank?
      end
      row :logo do
        image_tag(d.logo.url(:thumb)) unless d.logo.blank?
      end
      row :white_logo do
        image_tag(d.white_logo.url(:thumb)) unless d.white_logo.blank?
      end
      row :updated_at
      row :created_at
    end
  end

end
