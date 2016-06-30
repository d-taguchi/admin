class UserMail < ActiveRecord::Base

    # リレーション設定
    # 1<user> : 多<user_mail>
    belongs_to :user, foreign_key: "user_id"
end
