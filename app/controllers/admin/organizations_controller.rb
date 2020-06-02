class Admin::OrganizationsController < AdminController
  before_action :set_organization, only: [:show, :edit, :update, :destroy]

  # GET /organizations
  # GET /organizations.json
  def index
    @organizations = Organization.all
    @admins = OrganizationAdmin.all
    @users = RegisteredUser.all
  end

  # GET /organizations/1
  # GET /organizations/1.json
  def show
    @organization_events = Event.joins(:organization).where(organization: params[:id])
  end

  # GET /organizations/new
  def new
    @organization = Organization.new
  end

  # GET /organizations/1/edit
  def edit
  end

  # POST /organizations
  # POST /organizations.json
  def create
    @organization = Organization.new(name: params[:organization][:name], description: params[:organization][:description], bannerOrg: params[:organization][:bannerOrg])
    if @organization.save
      @organization_admin = OrganizationAdmin.new(admin_id: 1,organization_id: @organization.id)
      @organization_admin.save
    end

    redirect_to admin_organizations_path
  end

  # PATCH/PUT /organizations/1
  # PATCH/PUT /organizations/1.json
  def update
      @organization.update(organization_params)
      redirect_to admin_organizations_path
  end

  # DELETE /organizations/1
  # DELETE /organizations/1.json
  def destroy
    @organization = Organization.find(params[:id])
    @organization.destroy
    redirect_to admin_organizations_path
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_organization
      @organization = Organization.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def organization_params
      params.fetch(:organization).permit(:name,:description,:bannerOrg)
    end
end
