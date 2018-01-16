ActiveAdmin.register Widget do
  config.per_page = 20
  config.sort_order = 'created_at_desc'

  filter :title
  filter :summary
  filter :data_url
  filter :content
  filter :dataset
  filter :visualization
  filter :attribution
  filter :published
  filter :partner
  filter :widget_type
  filter :updated_at
  filter :created_at

  controller do
    def permitted_params
      params.permit(:id, widget: [:title, :summary, :data_url, :content, :widget_config, :attribution,
                                  :published, :partner_id, :dataset, :visualization, :widget_type_id])
    end
  end

  index do
    column :title
    column :summary
    column :published
    column :partner
    column :dataset
    column :widget_type
    column :updated_at
    column :created_at
    actions
  end

  form multipart: true do |f|
    f.semantic_errors *f.object.errors.keys
    f.inputs do
      f.input :title
      f.input :summary
      f.input :published
      f.input :widget_type, include_blank: false
      f.input :partner, include_blank: false
      f.input :data_url
      f.input :content
      f.input :widget_config
      f.input :attribution
      f.input :dataset
      f.input :visualization
    end
    f.actions
  end

  show do |d|
    attributes_table do
      row :title
      row :slug
      row :summary
      row :data_url
      row :content
      row :widget_config
      row :published
      row :partner
      row :dataset
      row :visualization
      row :widget_type
      row :attribution
      row :updated_at
      row :created_at
    end
  end

end
