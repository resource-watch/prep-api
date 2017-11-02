class Api::UserDashboardsController < ApiController

  before_action :set_user_dashboard, only: %i[show update destroy]

  # GET /user_dashboards
  def index
    render json: UserDashboard.fetch_all(filter_params),
           each_serializer: Api::UserDashboardSerializer, status: 200
  end

  # GET /dashboards/:slug
  def show
    if @user_dashboard
      render json: @user_dashboard, serializer: Api::UserDashboardSerializer, status: 200
    else
      render json: { status: 404, error: 'Dashboard not found' }
    end
  end

  # POST /dashboard
  def create
    @user_dashboard = UserDashboard.new(dashboard_params)
    render json: @user_dashboard, status: 201 if @user_dashboard.save
  end

  # PUT /dashboard/:id
  def update
    @user_dashboard.update(dashboard_params)
    render json: @user_dashboard
  end

  # DELETE /dashboard/:id
  def destroy
    @user_dashboard.destroy
    head :no_content
  end

  private

  def dashboard_params
    params.permit(:name, :description, :content, :published, :summary,
                  :private, :user_id, :photo)
  end

  def filter_params
    params.permit(filter: %w[name slug published private user_id])
  end

  def set_user_dashboard
    @user_dashboard = params[:id].id? ? UserDashboard.find(params[:id]) : UserDashboard.find_by_slug(params[:id])
  end
end