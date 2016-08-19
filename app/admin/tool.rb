ActiveAdmin.register Tool do

  permit_params :title, :summary, :content, :url

  form do |f|
    f.semantic_errors
    f.inputs 'Tool Detail' do
      f.input :title, required: true
      f.input :summary
      f.input :url
    end
    f.actions
  end

end
