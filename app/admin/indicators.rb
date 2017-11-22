ActiveAdmin.register Indicator do
  config.per_page = 20
  config.sort_order = 'created_at_desc'

  filter :title
  filter :summary
  filter :content
  filter :published
  filter :updated_at
  filter :created_at

  controller do
    def permitted_params
      params.permit(:id, indicator: [:title, :published, :summary, :content])
    end
  end

  index do
    column :title
    column :summary
    column :published
    column :updated_at
    column :created_at
    actions
  end

  form multipart: true do |f|
    f.semantic_errors *f.object.errors.keys
    f.inputs do
      f.input :title
      f.input :published
      f.input :summary
      f.input :content
    end
    f.actions
  end

  show do |d|
    attributes_table do
      row :title
      row :summary
      row :content
      row :published
      row :updated_at
      row :created_at
    end
  end

end
