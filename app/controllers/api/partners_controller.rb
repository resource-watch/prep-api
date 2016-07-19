class Api::PartnersController < ApiController

  # GET /partners
  def index
    partners = Partner.all.where(published: true)

    render json: partners
  end

end
