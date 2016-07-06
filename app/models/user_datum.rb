class UserDatum < ActiveRecord::Base

    # リレーション設定
    # 1<user> : 1 <user_datum>
    belongs_to :user, foreign_key: "user_id"

    has_one :prefecture, primary_key: 'pref_id', foreign_key: 'id'
end
