ActiveAdmin.register Widget do

  index do
    selectable_column
    id_column
    column :widget_type
    column :title
    column :summary
    column :dataset
    column :visualization
    column :partner
    column :published
    actions
  end

  permit_params :widget_type_id, :title, :slug, :summary, :content, :dataset, :visualization, :data_url, :widget_config, :partner_id, :published

  conn = Faraday.new(:url => ENV['RW_API_URL']) do |faraday|
    faraday.request  :url_encoded
    # faraday.response :logger
    faraday.adapter  Faraday.default_adapter
  end

  datasetRequest = conn.get '/datasets', { :app => 'prep' }
  datasets = JSON.parse datasetRequest.body

  form :html => {:id => 'widget_form'} do |f|

    if (f.object.dataset)
      params = { :app => 'prep', :datasetId => f.object.dataset, :default => true}
      visualizationRequest = conn.get '/widgets/', params
      visualization = JSON.parse visualizationRequest.body
    else
      visualization = []
    end

    f.semantic_errors
    f.inputs 'Widget Detail' do
      f.input :widget_type, required: true, :selected => 1
      f.input :dataset, as: :select, collection: datasets.map{|dc|[dc['name'],dc['id'],{ :selected => dc['id']===f.object.dataset }]}
      f.input :visualization, as: :select, collection: visualization.map{|dc|[dc['name'],dc['id'],{ :selected => dc['id']===f.object.visualization }]}
      div id: "widget-preview"
      f.input :title, required: true
      f.input :slug, required: true
      f.input :summary
      f.input :content
      f.input :data_url, required: true
      f.input :widget_config, as: :hidden, required: true
      f.input :partner, required: true
      f.input :published, as: :boolean
    end
    f.actions
  end

end
