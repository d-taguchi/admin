class PartnerMail < ActiveRecord::Base

    # リレーション設定
    # 1<partner> : 多<staff_id>
    belongs_to :partner_staff, foreign_key: "staff_id"
end
