class Api::WidgetsController < ApiController

  before_action :set_widget, only: [:update, :destroy]

  # GET /widgets
  def index
    widgets = Widget.all
    if params.has_key?(:published)
      widgets = widgets.published(params[:published]) if params[:published] != 'all'
    else
      widgets = widgets.published
    end
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

  # POST /widgets
  def create
    @widget = Widget.new(widget_params)
    render json: @widget, status: 201 if @widget.save
  end

  # PUT /widgets/:id
  def update
    @widget.update(widget_params)
    render json: @widget
  end

  # DELETE /widgets/:id
  def destroy
    @widget.destroy
    head :no_content
  end

  private

    def widget_params
      # whitelist params
      params.permit(:widget_type_id, :title, :slug, :summary, :content, :dataset, :visualization, :attribution, :data_url, :widget_config, :partner_id, :published)
    end

    def set_widget
      @widget = Widget.find(params[:id])
    end

end
