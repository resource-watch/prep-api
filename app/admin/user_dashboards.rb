ActiveAdmin.register UserDashboard do
  config.per_page = 20
  config.sort_order = 'created_at_desc'

  filter :name
  filter :description
  filter :content
  filter :summary
  filter :user_id
  filter :published
  filter :private
  filter :updated_at
  filter :created_at

  controller do
    def permitted_params
      params.permit(:id, user_dashboard: [:name, :description, :content,
                                :summary, :private, :published,
                                :user_id, :photo])
    end
  end

  index do
    column :name
    column :summary
    column :description
    column :published
    column :private
    column :user_id
    column :updated_at
    column :created_at
    actions
  end

  form multipart: true do |f|
    f.semantic_errors *f.object.errors.keys
    f.inputs do
      f.input :name
      f.input :summary
      f.input :description
      f.input :content
      f.input :private
      f.input :published
      f.input :user_id
      f.input :photo, as: :file, hint: f.object.photo.present? ? \
        image_tag(f.object.photo.url) : content_tag(:span, 'No image yet')
    end
    f.actions
  end

  show do |d|
    attributes_table do
      row :name
      row :slug
      row :description
      row :content
      row :published
      row :summary
      row :private
      row :user_id
      row :photo do
        image_tag(d.photo.url(:thumb)) unless d.photo.blank?
      end
      row :updated_at
      row :created_at
    end
  end

end
