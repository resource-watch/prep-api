ActiveAdmin.register Indicator do

  permit_params :title, :summary, :content, :published, widget_ids: []

  form do |f|
    f.semantic_errors
    f.inputs 'Dashboards Detail' do
      f.input :title, required: true
      f.input :summary
      f.input :content
      f.input :widget
    end
    f.actions
  end

end
