# coding: utf-8

## trancate
# connection設定
connection = ActiveRecord::Base.connection

# table設定
tables = %w[
    managers
    users
    user_data
    user_mails
    partners
    partner_staffs
    partner_mails
]

# table毎にトランケート
tables.each do |table|
    connection.execute("TRUNCATE #{table}") unless table == "schema_migrations"
end

## Manager
Manager.create!(
    :name     => '管理者',
    :group    => 100,
    :password => '.admin',
    :email    => 'd-taguchi@ecvoo.net',
    :status   => 1
)

## Test用に200件作成
200.times do |i|
    ## Partner
    Partner.create!(
        :view_name         => "パートナー#{i + 1}",
        :company_name      => "パートナー#{i + 1}",
        :company_name_kana => "パートナー#{i + 1}",
        :tel               => "0311111111",
        :status            => 1
    )

    PartnerStaff.create!(
        :partner_id => i + 1,
        :group      => 1,
        :password   => '.admin',
        :name       => "スタッフ#{i + 1}",
        :name_kana  => "スタッフ#{i + 1}",
        :status     => 1,
    )

    PartnerMail.create!(
        :partner_staff_id => i + 1,
        :mail_account     => "test_#{i + 1}",
        :mail_domain      => "test#{i + 1}.com",
        :serch_hash       => "test#{i + 1}",
        :send_flag        => true,
    )

    ## User
    User.create!(
        :group    => 1,
        :password => '.admin',
        :status   => 1
    )

    ## UserDatum
    UserDatum.create!(
        :user_id          => i + 1,
        :nickname         => "テスト#{i + 1}",
        :family_name      => "テスト#{i + 1}",
        :first_name       => "テスト#{i + 1}",
        :family_name_kana => "テスト#{i + 1}",
        :first_name_kana  => "テスト#{i + 1}",
        :sex              => (i % 2 == 0)? 1 : 2,
        :birthday         => "1999-06-06",
        :pref_id          => 8,
    )

    ## UserMail
    UserMail.create!(
        :user_id      => i + 1,
        :mail_account => "test_#{i + 1}",
        :mail_domain  => "test#{i + 1}.com",
        :serch_hash   => "test#{i + 1}",
        :send_flag    => true,
    )
end



# ## User
# User.create!(
#     :group    => 99,
#     :password => '.admin',
#     :status   => 1
# )
#
# ## UserDatum
# UserDatum.create!(
#     :user_id          => 1,
#     :nickname         => 'テスト',
#     :family_name      => 'テスト',
#     :first_name       => 'テスト',
#     :family_name_kana => 'テスト',
#     :first_name_kana  => 'テスト',
#     :sex              => 'テスト',
#     :birthday         => 'テスト',
#     :pref_id          => 'テスト'
# )
