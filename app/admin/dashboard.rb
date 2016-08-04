ActiveAdmin.register Dashboard do

  index do
    selectable_column
    id_column
    column :title
    column :summary
    column :partner
    column :published
    actions
  end

  permit_params :title, :slug, :summary, :content, :image, :partner_id, :published, :indicator_id, insight_ids:[], tool_ids:[]

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
      f.input :indicator, :include_blank => false, required: true
      f.input :insights
      f.input :tools
      f.input :partner, required: true
      f.input :published, as: :boolean
    end
    f.actions
  end

end
