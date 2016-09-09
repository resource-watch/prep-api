ActiveAdmin.register Tool do

  permit_params :title, :summary, :content, :url, :attribution, :partner_id, :published

  index do
    selectable_column
    id_column
    column :title
    column :summary
    column :url
    column :attribution
    column :published
    actions
  end

  form do |f|
    f.semantic_errors
    f.inputs 'Tool Detail' do
      f.input :title, required: true
      f.input :summary
      f.input :url
      f.input :partner
      f.input :attribution
      f.input :published
    end
    f.actions
  end

end
