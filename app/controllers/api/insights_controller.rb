class Api::InsightsController < ApiController

  before_action :set_insight, only: [:show, :update, :destroy]

  # GET /insights
  def index
    published_param = params.has_key?(:published) ? params[:published] : true
    insights = Insight.all.where(published: published_param).order(:updated_at).reverse
    render json: insights, each_serializer: Api::InsightSerializer, status: 200
  end

  # GET /insights/:slug
  def show
    insight = Insight.find_by_slug(params[:slug])

    if insight
      render json: insight, serializer: Api::InsightSerializer, status: 200
    else
      render json: {status: 404, error: 'Insight not found'}
    end
  end

  # POST /insights
  def create
    @insight = Insight.new(insight_params)
    render json: @insight, status: 201 if @insight.save
  end

  # PUT /insights/:id
  def update
    @insight.update(insight_params)
    render json: @insight
  end

  # DELETE /insights/:id
  def destroy
    @insight.destroy
    head :no_content
  end

  private

    def insight_params
      # whitelist params
      params.permit(:title, :slug, :template_type, :summary, :content, :image, :content_url, :embeddable, :partner_id, :attribution, :published)
    end

    def set_insight
      @insight = Insight.find(params[:id])
    end

end
