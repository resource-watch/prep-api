class Api::PartnersController < ApiController

  # GET /partners
  def index
    if params.has_key?(:featured) and params.has_key?(:partners_type)
      partners = Partner.featured(params[:featured]).partners_type(params[:partners_type]).published
    elsif params.has_key?(:featured)
      partners = Partner.featured(params[:featured]).published
    elsif params.has_key?(:partners_type)
      partners = Partner.featured(params[:partners_type]).published
    else
      partners = Partner.published
    end

    render json: partners, each_serializer: Api::PartnerSerializer, status: 200
  end

end
