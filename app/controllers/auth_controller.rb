class AuthController < ApplicationController

    # ## 事前処理スキップ
    # skip_before_action :is_logged_in?
    #
    ## ログイン認証画面
    def index
        @manager = Manager.new
        # レイアウト変更
        render :layout => 'auth'
    end
    #
    # ## ログイン認証処理
    # def create
    #     @manager = Manager.find_by(email: manager_params[:email])
    #
    #     if @manager && @manager.authenticate(manager_params[:password])
    #         reset_session
    #         session[:manager] = @manager
    #         # 元の場所へ遷移
    #         redirect_to params[:referer].present? ? params[:referer] : auth_index_path
    #     else
    #         redirect_to :back, alert: {errors: 'ユーザー名またはパスワードが違います。'}
    #     end
    # end
    #
    # ## ログアウト
    # def destroy
    #     reset_session
    #     redirect_to auth_index_path
    # end
    #
    # ##
    # private def manager_params
    #     params.require(:manager).permit(:email, :password)
    # end
end
