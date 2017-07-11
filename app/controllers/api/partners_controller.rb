class Api::PartnersController < ApiController

  before_action :set_partner, only: [:show, :update, :destroy]

  # GET /partners
  def index
    published_param = params.has_key?(:published) ? params[:published] : true

    if params.has_key?(:featured) and params.has_key?(:partner_type)
      partners = Partner.featured(params[:featured]).partners_type(params[:partner_type]).published(published_param)
    elsif params.has_key?(:featured)
      partners = Partner.featured(params[:featured]).published(published_param)
    elsif params.has_key?(:partner_type)
      partners = Partner.partner_type(params[:partner_type]).published(published_param)
    else
      partners = Partner.published(published_param)
    end

    render json: partners, each_serializer: Api::PartnerSerializer, status: 200
  end

  # POST /partners
  def create
    @partner = Partner.new(partner_params)
    render json: @partner, status: 201 if @partner.save
  end

  # PUT /partners/:id
  def update
    @partner.update(partner_params)
    render json: @partner
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
      @partner = Partner.find(params[:id])
    end

end
