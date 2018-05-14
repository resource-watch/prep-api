class Api::ResourcesController < ApiController

  before_action :set_resource, only: %w[show update destroy]

  # GET /resources
  def index
    resources =
      case params[:env]
      when 'staging'
        Resource.staging
      when 'pre-production'
        Resource.pre_production
      else
        Resource.production
      end
      .filter(filterable_params(params))

    resources = resources.order(:updated_at).reverse
    render json: resources, each_serializer: Api::ResourceSerializer, status: 200
  end

  # GET /resources/:slug
  def show
    if @resource
      render json: @resource, include: '**', serializer: Api::ResourceSerializer,
             status: 200
    else
      render json: { status: 404, error: 'Resource not found' }
    end
  end

  # POST /resource
  def create
    @resource = Resource.new(resource_params)
    render json: @resource, status: 201 if @resource.save
  end

  # PUT /resource/:id
  def update
    @resource.update(resource_params)
    render json: @resource
  end

  # DELETE /resource/:id
  def destroy
    @resource.destroy
    head :no_content
  end

  private

  def resource_params
    # whitelist params
    params.permit(:title, :slug, :description, :url, :photo, :resource_type, :published)
  end

  def set_resource
    env = params[:env].tr('-', '_')

    @resource = params[:id].id? ? Resource.find_by(id: params[:id], env => true) : Resource.find_by(id: params[:id], env => true)
  end

  def filterable_params(params)
    params.slice(:published, :resource_type)
  end

end
