class Api::DashboardsController < ApiController
  include JSONAPI::Utils

  def create
    dashboard = Dashboard.new(resource_params)
    if dashboard.save
      dashboard.manage_content(request.base_url)
      jsonapi_render json: dashboard, status: :created
    else
      jsonapi_render_errors json: dashboard, status: :unprocessable_entity
    end
  end

  def update
    dashboard = Dashboard.find(params[:id])
    if dashboard.update(resource_params)
      dashboard.manage_content(request.base_url)
      jsonapi_render json: dashboard
    else
      jsonapi_render_errors json: dashboard, status: :unprocessable_entity
    end
  end
end
