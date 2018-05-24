ActiveAdmin.register Tool do
  config.per_page = 20
  config.sort_order = 'created_at_desc'

  filter :title
  filter :summary
  filter :url
  filter :urlattribution
  filter :published
  filter :partner
  filter :updated_at
  filter :created_at

  controller do
    def permitted_params
      params.permit(:id, tool: [:title, :summary, :partner_id,
                                :production, :staging, :preproduction,
                                :attribution, :url, :published])
    end
  end

  index do
    column :title
    column :url
    column :published
    column :partner
    column :updated_at
    column :created_at
    actions
  end

  form multipart: true do |f|
    f.semantic_errors *f.object.errors.keys
    f.inputs do
      f.input :title
      f.input :summary
      f.input :url
      f.input :attribution
      f.input :published
      f.input :production
      f.input :preproduction
      f.input :staging
      f.input :partner
    end
    f.actions
  end

  show do |d|
    attributes_table do
      row :title
      row :summary
      row :url
      row :attribution
      row :published
      row :production
      row :preproduction
      row :staging
      row :partner
      row :updated_at
      row :created_at
    end
  end

end
