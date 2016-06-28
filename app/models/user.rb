class User < ActiveRecord::Base

    # パスワードハッシュプラグイン
    has_secure_password

    # リレーション設定
    # dependent: :destroy userに紐づくdatum削除
    has_one :user_datum, dependent: :destroy
end
