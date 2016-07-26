ActiveAdmin.register Widget do

  controller do
    def edit
      @widget = Widget.find(params[:id])

      conn = Faraday.new(:url => ENV['RW_API_URL']) do |faraday|
        faraday.request  :url_encoded
        # faraday.response :logger
        faraday.adapter  Faraday.default_adapter
      end

      datasetRequest = conn.get '/datasets', { :app => 'PREP' }
      @datasets = JSON.parse datasetRequest.body
      @datasets = @datasets.map{|dc|[dc['name'],dc['id'],{ :selected => dc['id']===@widget.dataset }]}

      if (@widget.dataset)
        visualizationRequest = conn.get '/datasets' + @widget.dataset
        @visualization = JSON.parse visualizationRequest.body
      else
        @visualization = []
      end
    end
  end

  permit_params :title, :slug, :summary, :content, :dataset, :visualization, :data_url, :json_spec, :partner_id, :published

  form do |f|
    f.semantic_errors
    f.inputs 'Widget Detail' do
      f.input :title, required: true
      f.input :slug, required: true
      f.input :summary
      f.input :content
      f.input :data_url, required: true
      f.input :dataset, as: :select, collection: @datasets
      f.input :visualization, as: :select, collection: @visualization
      f.input :json_spec, as: :hidden, required: true
      f.input :partner, required: true
      f.input :published, as: :boolean
    end
    f.actions
  end

end
