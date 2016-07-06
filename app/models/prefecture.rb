class Prefecture < ActiveRecord::Base
    # リレーション設定
    # 1<user_datum> : 1 <pref_id>
    belongs_to :user_datum
end
