ActiveAdmin.register Insight do
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
      params.permit(:id, insight: [:title, :published, :summary, :content, :content_url,
                                   :partner_id, :attribution, :template_type, :embeddable])
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
      f.input :content_url
      f.input :partner
      f.input :attribution
      f.input :template_type
      f.input :embeddable
      f.input :image, as: :file, hint: f.object.image.present? ? \
        image_tag(f.object.image.url) : content_tag(:span, 'No image yet')
    end
    f.actions
  end

  show do |d|
    attributes_table do
      row :title
      row :slug
      row :published
      row :summary
      row :content
      row :content_url
      row :partner
      row :attribution
      row :template_type
      row :embeddable
      row :image do
        image_tag(d.image.url(:thumb)) unless d.image.blank?
      end
      row :updated_at
      row :created_at
    end
  end
end
