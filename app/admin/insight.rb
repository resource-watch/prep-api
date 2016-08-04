ActiveAdmin.register Insight do

  index do
    selectable_column
    id_column
    column :title
    column :summary
    column :content_url
    column :partner
    column :published
    actions
  end

  permit_params :title, :slug, :summary, :content, :image, :content_url, :partner_id, :published

  form do |f|
    f.semantic_errors
    f.inputs 'Insight Detail' do
      f.input :title, required: true
      f.input :slug, required: true
      f.input :summary
      f.input :content
      f.input :image, as: :file, :hint => f.object.image.present? \
        ? image_tag(f.object.image.url)
        : content_tag(:span, "no header image uploaded yet")
      f.input :content_url
      f.input :partner
      f.input :published, as: :boolean
    end
    f.actions
  end

end
