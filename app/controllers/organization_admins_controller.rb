class OrganizationAdminsController < ApplicationController
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
    @organization_admin = OrganizationAdmin.new(organization_admin_params)

    respond_to do |format|
      if @organization_admin.save
        format.html { redirect_to @organization_admin, notice: 'Organization admin was successfully created.' }
        format.json { render :show, status: :created, location: @organization_admin }
      else
        format.html { render :new }
        format.json { render json: @organization_admin.errors, status: :unprocessable_entity }
      end
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
    @organization_admin.destroy
    respond_to do |format|
      format.html { redirect_to organization_admins_url, notice: 'Organization admin was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_organization_admin
      @organization_admin = OrganizationAdmin.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def organization_admin_params
      params.fetch(:organization_admin, {})
    end
end
