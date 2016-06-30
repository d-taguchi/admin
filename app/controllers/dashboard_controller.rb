class DashboardController < ApplicationController
    def index
        # 登録ユーザー数
        @user_count = User.count

        # 登録パートナー数
        @partner_count = Partner.count
    end
end
