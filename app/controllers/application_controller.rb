class ApplicationController < ActionController::Base
    # Prevent CSRF attacks by raising an exception.
    # For APIs, you may want to use :null_session instead.
    protect_from_forgery with: :exception

    # ## ログインチェック
    # before_action :is_logged_in?
    #
    # ## セッションリセット
    # def reset_session
    #     session[:manager] = nil
    #     @current_manager  = nil
    # end
    #
    # ## ログインチェック
    # def is_logged_in?
    #     manager_id = session[:manager]
    #     if manager_id then
    #         begin
    #             # 取得
    #             @current_manager = Manager.find(manager_id)
    #         rescue ActiveRecord::RecordNotFound
    #             # セッションリセット
    #             reset_session
    #         end
    #     end
    #     # 取れなかった場合はログイン画面にリダイレクト
    #     unless @current_manager
    #         flash[:referer] = request.fullpath
    #         redirect_to auth_index_path
    #     end
    # end
end
