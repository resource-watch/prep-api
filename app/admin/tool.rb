ActiveAdmin.register Tool do

  permit_params :title, :summary, :content, :url, :attribution

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
      f.input :attribution
    end
    f.actions
  end

end
