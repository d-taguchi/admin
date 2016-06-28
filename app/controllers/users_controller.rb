class UsersController < ApplicationController

    before_action :set_user, only: [:show, :destroy]

    # GET /users
    def index
        @users = User.page(params[:page])
    end

    # GET /users/1
    def show
        @user = User.find(params[:id])
    end

    # DELETE /users/1
    def destroy
        @user.destroy
        respond_to do |format|
            format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
        end
    end

    private
        # Use callbacks to share common setup or constraints between actions.
        def set_user
            @user = User.find(params[:id])
        end

        # Never trust parameters from the scary internet, only allow the white list through.
        def user_params
            params.fetch(:user, {})
        end
end
