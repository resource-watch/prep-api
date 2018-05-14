class Api::DashboardsController < ApiController

  before_action :set_dashboard, only: [:show, :update, :destroy]

  # GET /dashboards
  def index
    dashboards =
      case params[:env]
      when 'staging'
        Dashboard.staging
      when 'pre-production'
        Dashboard.pre_production
      else
        Dashboard.production
      end

    if params.has_key?(:published)
      dashboards = dashboards.published(params[:published]) if params[:published] != 'all'
    else
      dashboards = dashboards.published
    end

    dashboards = dashboards.user_id(params[:user]) if params.has_key?(:user)

    dashboards = dashboards.order(:updated_at).reverse
    render json: dashboards, each_serializer: Api::DashboardSerializer, status: 200
  end

  # GET /dashboards/:slug
  def show
    if @dashboard
      render json: @dashboard, include: '**', serializer: Api::DashboardDetailSerializer, status: 200
    else
      render json: {status: 404, error: 'Dashboard not found'}
    end
  end

  # POST /dashboard
  def create
    @dashboard = Dashboard.new(dashboard_params)
    if @dashboard.save
      @dashboard.manage_content(request.base_url)
      render json: @dashboard, status: 201
    end
  end

  # PUT /dashboard/:id
  def update
    if @dashboard.update(dashboard_params)
      @dashboard.manage_content(request.base_url)
      render json: @dashboard
    end
  end

  # DELETE /dashboard/:id
  def destroy
    @dashboard.destroy
    head :no_content
  end

  private

  def dashboard_params
    # whitelist params
    params.permit(:title, :slug, :summary, :content, :user_id, :image, :partner_id, :attribution, :published, :indicator_id, insight_ids:[], tool_ids:[], dashboard_ids:[], related_datasets:[])
  end

  def set_dashboard
    env = params[:env].tr('-', '_')

    @dashboard = params[:id].id? ? Dashboard.find_by(id: params[:id], env => true) : Dashboard.find_by(slug: params[:id], env => true)
  end

end
