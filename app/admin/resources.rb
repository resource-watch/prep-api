ActiveAdmin.register Resource do
  config.per_page = 20
  config.sort_order = 'created_at_desc'

  filter :title
  filter :description
  filter :url
  filter :resource_type, as: :select,
                              collection: Resource.resource_types,
                              include_blank: false
  filter :published
  filter :updated_at
  filter :created_at

  controller do
    def permitted_params
      params.permit(:id, resource: [:title, :description, :published,
                                    :resource_type, :url, :photo])
    end
  end

  index do
    column :title
    column :url
    column :resource_type
    column :published
    column :updated_at
    column :created_at
    actions
  end

  form multipart: true do |f|
    f.semantic_errors *f.object.errors.keys
    f.inputs do
      f.input :title
      f.input :description
      f.input :url
      f.input :resource_type, as: :select,
                              collection: Resource.resource_types,
                              include_blank: false
      f.input :published
      f.input :photo, as: :file, hint: f.object.photo.present? ? \
        image_tag(f.object.photo.url) : content_tag(:span, 'No image yet')
    end
    f.actions
  end

  show do |d|
    attributes_table do
      row :title
      row :slug
      row :description
      row :url
      row :resource_type
      row :published
      row :photo do
        image_tag(d.photo.url(:thumb)) unless d.photo.blank?
      end
      row :updated_at
      row :created_at
    end
  end

end
