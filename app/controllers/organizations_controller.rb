class OrganizationsController < ApplicationController
  load_and_authorize_resource
  before_action :set_organization, only: [:show, :edit, :update, :destroy]

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

  # GET /organizations
  # GET /organizations.json
  def index
    #@organizations = Organization.all
    @organizations_created = Organization.joins(:organization_admins).where(organization_admins: {admin_id: current_registered_user.id})
    @organizations_joined = Organization.joins(:organization_members).where(organization_members: {registered_user_id: current_registered_user.id})
  end

  # GET /organizations/1
  # GET /organizations/1.json
  def show
    @organization_events = Event.joins(:organization).where(organization: params[:id]).where(visibility: "public")
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
    @organization = Organization.new(organization_params)
    respond_to do |format|
      if @organization.save
        @organization_admin = OrganizationAdmin.new(admin_id: current_registered_user.id, organization_id: @organization.id)
        @organization_admin.save
        format.html { redirect_to @organization, notice: 'Organization was successfully created.' }
        format.json { render :show, status: :created, location: @organization }
      else
        format.html { render :new }
        format.json { render json: @organization.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /organizations/1
  # PATCH/PUT /organizations/1.json
  def update
    respond_to do |format|
      if @organization.update(organization_params)
        format.html { redirect_to @organization, notice: 'Organization was successfully updated.' }
        format.json { render :show, status: :ok, location: @organization }
      else
        format.html { render :edit }
        format.json { render json: @organization.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /organizations/1
  # DELETE /organizations/1.json
  def destroy
    @organization.destroy
    respond_to do |format|
      format.html { redirect_to organizations_url, notice: 'Organization was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_organization
      @organization = Organization.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def organization_params
      params.fetch(:organization, {}).permit(:name,:description,:bannerOrg)
    end
end
