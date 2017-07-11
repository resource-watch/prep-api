class Api::PartnersController < ApiController

  before_action :set_partner, only: [:show, :update, :destroy]

  # GET /partners
  def index
    partners = Partner.all

    if params.has_key?(:published)
      partners = partners.published(params[:published]) if params[:published] != 'all'
    else
      partners = partners.published
    end

    if params.has_key?(:featured)
      partners = partners.featured(params[:featured])
    end

    if params.has_key?(:partner_type)
      partners = partners.featured(params[:partner_type])
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
