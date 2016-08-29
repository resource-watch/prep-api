ActiveAdmin.register Indicator do

  permit_params :title, :summary, :content, :published, widget_ids: []

  index do
    selectable_column
    id_column
    column :title
    column :summary
    # column :published
    actions
  end

  form do |f|
    f.semantic_errors
    f.inputs 'Dashboards Detail' do
      f.input :title, required: true
      f.input :summary
      f.input :content
      f.input :widgets
      # f.input :published
    end
    f.actions
  end

end
