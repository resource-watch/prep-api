ActiveAdmin.register Dashboard do

  permit_params :title,:slug, :summary, :content, :image, :partner_id, :published, dataset_ids: []

  form do |f|
    f.semantic_errors
    f.inputs 'Dashboards Detail' do
      f.input :title, required: true
      f.input :slug, required: true
      f.input :summary
      f.input :content
      f.input :image, as: :file, :hint => f.object.image.present? \
        ? image_tag(f.object.image.url)
        : content_tag(:span, "no header image uploaded yet")
      f.input :dataset
      f.input :partner, required: true
      f.input :published, as: :boolean
    end
    f.actions
  end

end
