class Admin::OrganizationAdminsController < AdminController
  before_action :set_organization_admin, only: [:show, :edit, :update, :destroy]

  # GET /organization_admins
  # GET /organization_admins.json
  def index
    @organization_admins = OrganizationAdmin.all
  end

  # GET /organization_admins/1
  # GET /organization_admins/1.json
  def show
  end

  # GET /organization_admins/new
  def new
    @organization_admin = OrganizationAdmin.new
  end

  # GET /organization_admins/1/edit
  def edit
  end

  # POST /organization_admins
  # POST /organization_admins.json
  def create
    @organization_admin = OrganizationAdmin.new(organization_id: params[:organization_admin][:organization], admin_id: params[:organization_admin][:admin])
    if @organization_admin.save
      redirect_back(fallback_location: root_path)
    end
  end

  # PATCH/PUT /organization_admins/1
  # PATCH/PUT /organization_admins/1.json
  def update
    respond_to do |format|
      if @organization_admin.update(organization_admin_params)
        format.html { redirect_to @organization_admin, notice: 'Organization admin was successfully updated.' }
        format.json { render :show, status: :ok, location: @organization_admin }
      else
        format.html { render :edit }
        format.json { render json: @organization_admin.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /organization_admins/1
  # DELETE /organization_admins/1.json
  def destroy
    @org=@organization_admin.organization.id
    @organization_admin.destroy
    if OrganizationAdmin.where(:organization_id => @org).count == 0
      redirect_to organizations_path
    else
      redirect_back(fallback_location: root_path)
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_organization_admin
    @organization_admin = OrganizationAdmin.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def organization_admin_params
    params.fetch(:organization_admin, {}).permit(:organization_admin)
  end
end