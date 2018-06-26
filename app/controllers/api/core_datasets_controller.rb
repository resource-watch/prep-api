class Api::CoreDatasetsController < ApiController

  before_action :set_core_dataset, only: [:show, :update, :destroy]

  # GET /core_datasets
  def index
    @core_datasets = CoreDataset.all
    render json: @core_datasets, each_serializer: Api::CoreDatasetSerializer, status: 200
  end

  def show
    if @core_dataset
      render json: @core_dataset, serializer: Api::CoreDatasetSerializer, status: 200
    else
      render json: {status: 404, error: 'Core Dataset not found'}
    end
  end

  # POST /core_datasets
  def create
    @core_dataset = CoreDataset.new(core_dataset_params)
    if @core_dataset.save
      render json: @core_dataset, status: 201
    else
      render json: { status: :unprocessable_entity, errors: @core_dataset.errors }, status: 422
    end
  end

  # PUT /core_datasets/:id
  def update
    if @core_dataset.update(core_dataset_params)
      render json: @core_dataset
    else
      render json: { status: :unprocessable_entity, errors: @core_dataset.errors }, status: 422
    end
  end

  # DELETE /core_datasets/:id
  def destroy
    @core_dataset.destroy
    head :no_content
  end

  private

    def core_dataset_params
      # whitelist params
      params.permit(:title, :country_iso, :subcategory, dataset_ids: [], tags: [])
    end

    def set_core_dataset
      @core_dataset = CoreDataset.find_by(id: params[:id])
    end

end
