class Api::DashboardsController < ApiController

  # GET /dashboards
  def index
    dashboards = Dashboard.all.where(published: true).order(:updated_at).reverse
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

end
