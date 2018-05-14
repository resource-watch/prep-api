class Api::PartnersController < ApiController

  before_action :set_partner, only: [:show, :update, :destroy]

  # GET /partners
  def index
    partners =
      case params[:env]
      when 'staging'
        Partner.staging
      when 'pre-production'
        Partner.pre_production
      else
        Partner.production
      end

    if params.has_key?(:published)
      partners = partners.published(params[:published]) if params[:published] != 'all'
    else
      partners = partners.published
    end

    if params.has_key?(:featured)
      partners = partners.featured(params[:featured])
    end

    if params.has_key?(:partner_type)
      partners = partners.partner_type(params[:partner_type])
    end

    render json: partners, each_serializer: Api::PartnerSerializer, status: 200
  end

  def show
    if @partner
      render json: @partner, serializer: Api::PartnerSerializer, status: 200
    else
      render json: {status: 404, error: 'Partner not found'}
    end
  end

  # POST /partners
  def create
    @partner = Partner.new(partner_params)
    if @partner.save
      render json: @partner, status: 201
    else
      render json: { status: :unprocessable_entity, errors: @partner.errors }, status: 422
    end
  end

  # PUT /partners/:id
  def update
    if @partner.update(partner_params)
      render json: @partner
    else
      render json: { status: :unprocessable_entity, errors: @partner.errors }, status: 422
    end
  end

  # DELETE /partners/:id
  def destroy
    @partner.destroy
    head :no_content
  end

  private

    def partner_params
      # whitelist params
      params.permit(:name, :description, :url, :thumbnail, :logo, :white_logo, :contact_name, :contact_email, :featured, :published, :content, :partner_type)
    end

    def set_partner
      env = params[:env].tr('-', '_')

      @partner = Partner.find_by(id: params[:id], env => true)
    end

end
