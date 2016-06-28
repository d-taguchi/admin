# coding: utf-8

## trancate

# connection設定
connection = ActiveRecord::Base.connection

# table設定
tables = %w[managers users user_data]

# table毎にトランケート
tables.each do |table|
    connection.execute("TRUNCATE #{table}") unless table == "schema_migrations"
end

## Manager
Manager.create!(
    :name     => '管理者',
    :group    => 99,
    :password => '.admin',
    :email    => 'd-taguchi@ecvoo.net',
    :status   => 1
)


200.times do |i|
    ## User
    User.create!(
        :group    => 99,
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
