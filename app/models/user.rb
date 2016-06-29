class User < ActiveRecord::Base

    # パスワードハッシュプラグイン
    has_secure_password

    ## リレーション設定
    has_one :user_datum, dependent: :destroy
    has_many :user_mail, dependent: :destroy
end
