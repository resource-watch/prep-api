ActiveAdmin.register Widget do

  permit_params :title, :summary, :slug, :content, :partner_id, :published

  form do |f|
    f.semantic_errors
    f.inputs 'Widget Detail' do
      f.input :title, required: true
      f.input :slug, required: true
      f.input :summary
      f.input :content
      f.input :partner, required: true
      f.input :published, as: :boolean
    end
    f.actions
  end

end
