class Partner < ActiveRecord::Base

    ## リレーション設定
    has_many :partner_staff, dependent: :destroy
end
