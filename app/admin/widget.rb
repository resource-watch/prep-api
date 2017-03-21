ActiveAdmin.register Widget do

  index do
    selectable_column
    id_column
    column :widget_type
    column :title
    column :summary
    column :dataset
    column :partner
    column :published
    actions
  end

  permit_params :widget_type_id, :title, :slug, :summary, :content, :dataset, :visualization, :attribution, :data_url, :widget_config, :partner_id, :published

  conn = Faraday.new(:url => ENV['RW_API_URL']) do |faraday|
    faraday.request  :url_encoded
    faraday.response :logger
    faraday.adapter  Faraday.default_adapter
  end

  form :html => {:id => 'widget_form'} do |f|

    datasetRequest = conn.get('/v1/dataset', {
      application: 'prep',
      'page[size]': 10000,
      status: 'saved'
    })
    datasets = JSON.parse(datasetRequest.body)['data']

    if (f.object.dataset)
      visualizationRequest = conn.get('/v1/widget/', {
        application: 'prep',
        datasetId: f.object.dataset,
        'page[size]': 10000
      })
      visualization = JSON.parse(visualizationRequest.body)['data']
    else
      visualization = []
    end

    datasets_options = datasets.sort_by!{ |dc| dc['attributes']['name'] }.map{|dc| [dc['attributes']['name'],dc['id']]}
    visualization_options = visualization.sort_by!{ |vis| vis['name'] }.map{|vis| [vis['attributes']['name'], vis['id']]}

    f.semantic_errors
    f.inputs 'Widget Detail' do
      # f.input :widget_type, selected: 1, include_blank: false
      f.input :dataset, as: :select, collection: datasets_options, include_blank: '-- Select an option --'
      f.input :visualization, as: :select, collection: visualization_options, include_blank: '-- Select an option --'
      div id: "widget-preview"
      f.input :title, required: true
      f.input :slug, required: true
      f.input :summary
      f.input :content
      f.input :attribution
      f.input :data_url, required: true
      f.input :widget_config, as: :hidden, required: true
      f.input :partner, required: true, include_blank: '-- Select an option --'
      f.input :published, as: :boolean
    end
    f.actions
  end

end
