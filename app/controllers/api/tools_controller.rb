class Api::ToolsController < ApiController

  before_action :set_tool, only: [:show, :update, :destroy]

  # GET /tools
  def index
    tools =
      case params[:env]
      when 'staging'
        Tool.staging
      when 'pre-production'
        Tool.pre_production
      else
        Tool.production
      end

    if params.has_key?(:published)
      tools = tools.published(params[:published]) if params[:published] != 'all'
    else
      tools = tools.published
    end
    render json: tools, each_serializer: Api::ToolSerializer, status: 200
  end

  # GET /tools/:id
  def show
    if @tool
      render json: @tool, serializer: Api::ToolSerializer, status: 200
    else
      render json: {status: 404, error: 'Tool not found'}
    end
  end

  # POST /tools
  def create
    @tool = Tool.new(tool_params)
    render json: @tool, status: 201 if @tool.save
  end

  # PUT /tools/:id
  def update
    @tool.update(tool_params)
    render json: @tool
  end

  # DELETE /tools/:id
  def destroy
    @tool.destroy
    head :no_content
  end

  private

    def tool_params
      # whitelist params
      params.permit(:title, :summary, :content, :url, :attribution, :partner_id, :published)
    end

    def set_tool
      env = params[:env].tr('-', '_')

      @tool = Tool.find_by(id: params[:id], env => true)
    end

end
