class PartnerStaff < ActiveRecord::Base

    # パスワードハッシュプラグイン
    has_secure_password

    # リレーション設定
    has_many :partner_mail, dependent: :destroy

    # 1<partner> : 多<partner_mail>
    belongs_to :partner, foreign_key: "partner_id"
end
