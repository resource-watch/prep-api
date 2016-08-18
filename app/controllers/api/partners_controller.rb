class Api::PartnersController < ApiController

  # GET /partners
  def index
    if params.has_key?(:featured) && params[:featured] == "true"
      logger.debug params
      partners = Partner.featured
    else
      partners = Partner.published
    end

    render json: partners, each_serializer: Api::PartnerSerializer, status: 200
  end

end
