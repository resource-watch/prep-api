ActiveAdmin.register Dataset do

  permit_params :title, :summary, :slug, :content, :partner_id, :dataset_type_id, :published

  form do |f|
    f.semantic_errors
    f.inputs 'Dataset Detail' do
      f.input :title, required: true
      f.input :slug, required: true
      f.input :summary
      f.input :content
      f.input :data_url, required: true
      f.input :dataset_type, :include_blank => false, required: true
      f.input :json_spec, required: true
      f.input :partner, required: true
      f.input :published, as: :boolean
    end
    f.actions
  end

end
