class SystemAdministratorsController < ApplicationController
  before_action :set_system_administrator, only: [:show, :edit, :update, :destroy]

  # GET /system_administrators
  # GET /system_administrators.json
  def index
    @system_administrators = SystemAdministrator.all
  end

  # GET /system_administrators/1
  # GET /system_administrators/1.json
  def show
  end

  # GET /system_administrators/new
  def new
    @system_administrator = SystemAdministrator.new
  end

  # GET /system_administrators/1/edit
  def edit
  end

  # POST /system_administrators
  # POST /system_administrators.json
  def create
    @system_administrator = SystemAdministrator.new(system_administrator_params)

    respond_to do |format|
      if @system_administrator.save
        format.html { redirect_to @system_administrator, notice: 'System administrator was successfully created.' }
        format.json { render :show, status: :created, location: @system_administrator }
      else
        format.html { render :new }
        format.json { render json: @system_administrator.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /system_administrators/1
  # PATCH/PUT /system_administrators/1.json
  def update
    respond_to do |format|
      if @system_administrator.update(system_administrator_params)
        format.html { redirect_to @system_administrator, notice: 'System administrator was successfully updated.' }
        format.json { render :show, status: :ok, location: @system_administrator }
      else
        format.html { render :edit }
        format.json { render json: @system_administrator.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /system_administrators/1
  # DELETE /system_administrators/1.json
  def destroy
    @system_administrator.destroy
    respond_to do |format|
      format.html { redirect_to system_administrators_url, notice: 'System administrator was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_system_administrator
      @system_administrator = SystemAdministrator.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def system_administrator_params
      params.fetch(:system_administrator, {})
    end
end
