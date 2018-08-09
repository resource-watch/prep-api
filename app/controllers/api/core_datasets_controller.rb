class Api::CoreDatasetsController < ApiController

  before_action :set_core_dataset, only: [:show, :update, :destroy]

  # GET /core_datasets
  def index
    core_datasets =
      if params[:env].present?
        environments = params[:env].split(',')

        ids = environments.map do |env|
          CoreDataset.where(env => true)
        end.flatten.uniq.pluck(:id)

        CoreDataset.where(id: ids)
      else
        CoreDataset.production
      end

    if params.has_key?(:published)
      core_datasets = core_datasets.where(published: params[:published]) unless params[:published].eql? 'all'
    else
      core_datasets = core_datasets.where(published: 'TRUE')
    end
    render json: core_datasets, each_serializer: Api::CoreDatasetSerializer, status: 200
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
      params.permit(:title, :country_iso, :subcategory, :published, :staging,
                    :preproduction, :production, dataset_ids: [], tags: [])
    end

    def set_core_dataset
      environments = params[:env].present? ? params[:env].split(',') : ['production']
      core_dataset = params[:id].id? ? CoreDataset.find_by(id: params[:id]) : CoreDataset.find_by(slug: params[:id])

      matches = environments.map do |env|
        core_dataset.public_send(env)
      end

      @core_dataset = matches.include?(true) ? core_dataset : nil
    end
end
