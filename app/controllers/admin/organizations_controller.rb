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

    redirect_to admin_organizations_path, notice: 'Organization was successfully created.'
  end

  def members
    @org = Organization.find(params[:organization])
    @organization_admins = OrganizationAdmin.where(:organization => @org.id)
    @organization_members = OrganizationMember.where(:organization => @org.id)

    @already_users=[]

    @organization_admins.each do |e|
      @already_users.push(e.admin_id)
    end

    @organization_members.each do |e|
      @already_users.push(e.registered_user_id)
    end

    @users_not_admin= RegisteredUser.where.not(id: @already_users )
    @users_not_members= RegisteredUser.where.not(id: @already_users )

    @member = OrganizationMember.new
    @admin = OrganizationAdmin.new
  end

  # PATCH/PUT /organizations/1
  # PATCH/PUT /organizations/1.json
  def update
      @organization.update(organization_params)
      redirect_to admin_organizations_path, notice: 'Organization was successfully updated.'
  end

  # DELETE /organizations/1
  # DELETE /organizations/1.json
  def destroy
    @organization = Organization.find(params[:id])
    @organization.destroy
    redirect_to admin_organizations_path, notice: 'Organization was successfully destroyed.'
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
