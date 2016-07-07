class Api::InsightsController < ApiController

  # GET /insights
  def index
    insights = Insight.all.where(published: true)

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

end
