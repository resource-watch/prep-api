ActiveAdmin.register Widget do

  permit_params :title,:slug, :summary, :content, :data_url, :json_spec, :partner_id, :published

  form do |f|
    f.semantic_errors
    f.inputs 'Widget Detail' do
      f.input :title, required: true
      f.input :slug, required: true
      f.input :summary
      f.input :content
      f.input :data_url, required: true
      f.input :json_spec, required: true
      f.input :partner, required: true
      f.input :published, as: :boolean
    end
    f.actions
  end

end
