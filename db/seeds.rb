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
    regions
    prefectures
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


#============================================================
# MASTER系
#============================================================

## Region (地方)
Region.create!([
    {:id => 1, :name => '北海道地方', :name_kana => 'ホッカイドウチホウ'},
    {:id => 2, :name => '東北地方', :name_kana => 'トウホクチホウ'},
    {:id => 3, :name => '関東地方', :name_kana => 'カントウチホウ'},
    {:id => 4, :name => '中部地方', :name_kana => 'チュウブチホウ'},
    {:id => 5, :name => '近畿地方', :name_kana => 'キンキチホウ'},
    {:id => 6, :name => '中国地方', :name_kana => 'チュウゴクチホウ'},
    {:id => 7, :name => '四国地方', :name_kana => 'シコクチホウ'},
    {:id => 8, :name => '九州地方', :name_kana => 'キュウシュウチホウ'}
])

## Prefecture (都道府県)
Prefecture.create!([
    {:id => 1, :region_id => 1, :name => '北海道', :name_kana => 'ホッカイドウ'},
    {:id => 2, :region_id => 2, :name => '青森県', :name_kana => 'アオモリケン'},
    {:id => 3, :region_id => 2, :name => '岩手県', :name_kana => 'イワテケン'},
    {:id => 4, :region_id => 2, :name => '宮城県', :name_kana => 'ミヤギケン'},
    {:id => 5, :region_id => 2, :name => '秋田県', :name_kana => 'アキタケン'},
    {:id => 6, :region_id => 2, :name => '山形県', :name_kana => 'ヤマガタケン'},
    {:id => 7, :region_id => 2, :name => '福島県', :name_kana => 'フクシマケン'},
    {:id => 8, :region_id => 3, :name => '茨城県', :name_kana => 'イバラキケン'},
    {:id => 9, :region_id => 3, :name => '栃木県', :name_kana => 'トチギケン'},
    {:id => 10, :region_id => 3, :name => '群馬県', :name_kana => 'グンマケン'},
    {:id => 11, :region_id => 3, :name => '埼玉県', :name_kana => 'サイタマケン'},
    {:id => 12, :region_id => 3, :name => '千葉県', :name_kana => 'チバケン'},
    {:id => 13, :region_id => 3, :name => '東京都', :name_kana => 'トウキョウト'},
    {:id => 14, :region_id => 3, :name => '神奈川県', :name_kana => 'カナガワケン'},
    {:id => 15, :region_id => 4, :name => '新潟県', :name_kana => 'ニイガタケン'},
    {:id => 16, :region_id => 4, :name => '富山県', :name_kana => 'トヤマケン'},
    {:id => 17, :region_id => 4, :name => '石川県', :name_kana => 'イシカワケン'},
    {:id => 18, :region_id => 4, :name => '福井県', :name_kana => 'フクイケン'},
    {:id => 19, :region_id => 4, :name => '山梨県', :name_kana => 'ヤマナシケン'},
    {:id => 20, :region_id => 4, :name => '長野県', :name_kana => 'ナガノケン'},
    {:id => 21, :region_id => 4, :name => '岐阜県', :name_kana => 'ギフケン'},
    {:id => 22, :region_id => 4, :name => '静岡県', :name_kana => 'シズオカケン'},
    {:id => 23, :region_id => 4, :name => '愛知県', :name_kana => 'アイチケン'},
    {:id => 24, :region_id => 5, :name => '三重県', :name_kana => 'ミエケン'},
    {:id => 25, :region_id => 5, :name => '滋賀県', :name_kana => 'シガケン'},
    {:id => 26, :region_id => 5, :name => '京都府', :name_kana => 'キョウトフ'},
    {:id => 27, :region_id => 5, :name => '大阪府', :name_kana => 'オオサカフ'},
    {:id => 28, :region_id => 5, :name => '兵庫県', :name_kana => 'ヒョウゴケン'},
    {:id => 29, :region_id => 5, :name => '奈良県', :name_kana => 'ナラケン'},
    {:id => 30, :region_id => 5, :name => '和歌山県', :name_kana => 'ワカヤマケン'},
    {:id => 31, :region_id => 6, :name => '鳥取県', :name_kana => 'トットリケン'},
    {:id => 32, :region_id => 6, :name => '島根県', :name_kana => 'シマネケン'},
    {:id => 33, :region_id => 6, :name => '岡山県', :name_kana => 'オカヤマケン'},
    {:id => 34, :region_id => 6, :name => '広島県', :name_kana => 'ヒロシマケン'},
    {:id => 35, :region_id => 6, :name => '山口県', :name_kana => 'ヤマグチケン'},
    {:id => 36, :region_id => 7, :name => '徳島県', :name_kana => 'トクシマケン'},
    {:id => 37, :region_id => 7, :name => '香川県', :name_kana => 'カガワケン'},
    {:id => 38, :region_id => 7, :name => '愛媛県', :name_kana => 'エヒメケン'},
    {:id => 39, :region_id => 7, :name => '高知県', :name_kana => 'コウチケン'},
    {:id => 40, :region_id => 8, :name => '福岡県', :name_kana => 'フクオカケン'},
    {:id => 41, :region_id => 8, :name => '佐賀県', :name_kana => 'サガケン'},
    {:id => 42, :region_id => 8, :name => '長崎県', :name_kana => 'ナガサキケン'},
    {:id => 43, :region_id => 8, :name => '熊本県', :name_kana => 'クマモトケン'},
    {:id => 44, :region_id => 8, :name => '大分県', :name_kana => 'オオイタケン'},
    {:id => 45, :region_id => 8, :name => '宮崎県', :name_kana => 'ミヤザキケン'},
    {:id => 46, :region_id => 8, :name => '鹿児島県', :name_kana => 'カゴシマケン'},
    {:id => 47, :region_id => 8, :name => '沖縄県', :name_kana => 'オキナワケン'}
])
