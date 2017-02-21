class Api::PartnersController < ApiController

  # GET /partners
  def index
    if params.has_key?(:featured)
      partners = Partner.featured(params[:featured])
    else
      partners = Partner.published
    end

    render json: partners, each_serializer: Api::PartnerSerializer, status: 200
  end

end
