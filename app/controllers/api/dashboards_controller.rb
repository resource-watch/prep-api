class Api::DashboardsController < ApiController

  before_action :set_dashboard, only: [:show, :update, :destroy]

  # GET /dashboards
  def index
    dashboards = Dashboard.all

    if params.has_key?(:published)
      dashboards = dashboards.published(params[:published]) if params[:published] != 'all'
    else
      dashboards = dashboards.published
    end

    dashboards = dashboards.order(:updated_at).reverse
    render json: dashboards, each_serializer: Api::DashboardSerializer, status: 200
  end

  # GET /dashboards/:slug
  def show
    dashboard = Dashboard.find_by_slug(params[:slug])
    if dashboard
      render json: dashboard, include: '**', serializer: Api::DashboardDetailSerializer, status: 200
    else
      render json: {status: 404, error: 'Dashboard not found'}
    end
  end

  # POST /dashboard
  def create
    @dashboard = Dashboard.new(dashboard_params)
    render json: @dashboard, status: 201 if @dashboard.save
  end

  # PUT /dashboard/:id
  def update
    @dashboard.update(dashboard_params)
    render json: @dashboard
  end

  # DELETE /dashboard/:id
  def destroy
    @dashboard.destroy
    head :no_content
  end

  private

    def dashboard_params
      # whitelist params
      params.permit(:title, :slug, :summary, :content, :image, :partner_id, :attribution, :published, :indicator_id, insight_ids:[], tool_ids:[], dashboard_ids:[], related_datasets:[])
    end

    def set_dashboard
      @dashboard = Dashboard.find(params[:id])
    end

end
