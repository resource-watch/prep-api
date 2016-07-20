class Api::PartnersController < ApiController

  # GET /partners
  def index
    partners = Partner.all.where(published: true)

    render json: partners, each_serializer: Api::PartnerSerializer, status: 200
  end

end
