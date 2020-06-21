class UserProfilesController < ApplicationController
  before_action :set_user_profile, only: [:show, :edit, :update, :destroy]

  # GET /user_profiles/1
  # GET /user_profiles/1.json
  def show
    @user_profiles = UserProfile.joins(:registered_user)
    @registered_user_last = @registered_user
    @user_events_created = Event.where(event_creator_id: @registered_user.id)
    @user_events_joined = Event.joins(:event_guests).where(event_guests:{registered_user_id: @registered_user.id})
  end

  # GET /user_profiles/1/edit
  def edit
  end

  # PATCH/PUT /user_profiles/1
  # PATCH/PUT /user_profiles/1.json
  def update
    respond_to do |format|
      if @user_profile.update(biography: params[:user_profile][:biography], bannerProfile: params[:user_profile][:bannerProfile], imageProfile: params[:user_profile][:imageProfile]) and @registered_user.update(name: params[:user_profile][:name], last_name: params[:user_profile][:last_name], location: params[:user_profile][:location])
        format.html { redirect_to @user_profile, notice: 'User profile was successfully updated.' }
        format.json { render :show, status: :ok, location: @user_profile }
      else
        format.html { render :edit }
        format.json { render json: @user_profile.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /user_profiles/1
  # DELETE /user_profiles/1.json
  def destroy
    @user_profile.destroy
    respond_to do |format|
      format.html { redirect_to user_profiles_url, notice: 'User profile was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user_profile
      @user_profile = UserProfile.find(params[:id])
      @registered_user = @user_profile.registered_user
    end

    # Only allow a list of trusted parameters through.
    def user_profile_params
      params.fetch(:user_profile, {}).permit(:biography, :bannerProfile, :imageProfile,:registered_users,registered_user_attributes: [:name, :last_name, :location])
    end
end
