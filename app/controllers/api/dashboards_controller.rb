class Api::DashboardsController < ApiController

  before_action :set_dashboard, only: [:show, :update, :destroy]

  # GET /dashboards
  def index
    dashboards =
      if params[:env].present?
        environments = params[:env].split(',')

        ids = environments.map do |env|
          Dashboard.where(env => true)
        end.flatten.uniq.pluck(:id)

        Dashboard.where(id: ids)
      else
        Dashboard.production
      end

    if params.has_key?(:published)
      dashboards = dashboards.published(params[:published]) if params[:published] != 'all'
    else
      dashboards = dashboards.published
    end

    if params.has_key?(:or_tags)
      dashboards = dashboards.or_tags(params[:or_tags])
    end

    if params.has_key?(:and_tags)
      dashboards = dashboards.and_tags(params[:and_tags])
    end

    if params.has_key?(:or_locations)
      dashboards = dashboards.or_locations(params[:or_locations])
    end

    if params.has_key?(:and_locations)
      dashboards = dashboards.and_locations(params[:and_locations])
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
    params.permit(:title, :slug, :summary, :content, :user_id, :image,
                  :partner_id, :attribution, :published, :indicator_id,
                  :production, :preproduction, :staging, insight_ids: [], locations: [],
                  tool_ids: [], dashboard_ids: [], related_datasets: [], tags: [],
                  author_attributes: [:id, :name, :url, :contact_name, :contact_email,
                  :thumbnail, :logo, :white_logo, :_destroy])
  end

  def set_dashboard
    environments = params[:env].present? ? params[:env].split(',') : ['production']
    dashboard = params[:id].id? ? Dashboard.find_by(id: params[:id]) : Dashboard.find_by(slug: params[:id])

    matches = environments.map do |env|
      dashboard.public_send(env)
    end

    @dashboard = matches.include?(true) ? dashboard : nil
  end

end
