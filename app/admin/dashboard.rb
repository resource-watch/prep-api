ActiveAdmin.register Dashboard do

  index do
    selectable_column
    id_column
    column :title
    column :summary
    column :partner
    column :attribution
    column :published
    actions
  end

  permit_params :title, :slug, :summary, :content, :image, :partner_id, :attribution, :published, :indicator_id, insight_ids:[], tool_ids:[], dashboard_ids:[], related_datasets:[]

  conn = Faraday.new(:url => ENV['RW_API_URL']) do |faraday|
    faraday.request  :url_encoded
    faraday.adapter  Faraday.default_adapter
  end

  datasetRequest = conn.get '/datasets', { :app => 'prep' }
  datasets = JSON.parse datasetRequest.body

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
      f.input :dashboards, :label => "Related dashboards", collection: Dashboard.excluding_self(f.object)
      f.input :related_datasets,
        as: :select,
        collection: datasets.reject(&:blank?).map{|dc|[dc['name'],dc['id']]},
        :input_html => { :multiple => true }
      f.input :attribution
      f.input :partner, required: true
      f.input :published, as: :boolean
    end
    f.actions
  end

end
