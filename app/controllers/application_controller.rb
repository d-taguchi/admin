class ApplicationController < ActionController::Base
    protect_from_forgery with: :exception

    ## ログインチェック
    before_action :is_logged_in?

    ## セッションリセット
    def reset_session
        session[:manager] = nil
        @_manager  = nil
    end

    ## ログインチェック
    def is_logged_in?
        manager = session[:manager]
        if manager then
            begin
                # 取得
                @_manager = Manager.find(manager['id'])
            rescue ActiveRecord::RecordNotFound
                # セッションリセット
                reset_session
            end
        end
        # 取れなかった場合はログイン画面にリダイレクト
        unless @_manager
            flash[:referer] = request.fullpath
            redirect_to auth_index_path
        end
    end

    # cancanのメソッド
    # @override
    def current_ability
        @current_ability ||= Ability.new(@_manager)
    end

    # 権限無し時のエラーアクション
    rescue_from CanCan::AccessDenied do |exception|
        redirect_to root_url,alert: {errors: exception.message}
    end
end
