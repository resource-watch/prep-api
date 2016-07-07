class Api::WidgetsController < ApiController

  # GET /widgets
  def index
    widgets = Widget.all.where(published: true)

    render json: widgets, each_serializer: Api::WidgetSerializer, status: 200
  end

  # GET /widgets/:slug
  def show
    widget = Widget.find_by_slug(params[:slug])

    if widget
      render json: widget, serializer: Api::WidgetSerializer, status: 200
    else
      render json: {status: 404, error: 'Widget not found'}
    end
  end

end
