class Api::DatasetsController < ApiController

  # GET /datasets
  def index
    datasets = Dataset.all.where(published: true)

    render json: datasets, each_serializer: Api::DatasetSerializer, status: 200
  end

  # GET /datasets/:slug
  def show
    dataset = Dataset.find_by_slug(params[:slug])

    if dataset
      render json: dataset, serializer: Api::DatasetDetailSerializer, status: 200
    else
      render json: {status: 404, error: 'Dataset not found'}
    end
  end

end
