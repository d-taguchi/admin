## 定数
## @author d.taguchi

## サイト名
SITE_TITLE = 'mikaaaan'.freeze

# 権限 group
AUTHORITY_BAN   = -1  #  -1：禁止
AUTHORITY_GUEST = 0   #   0：ゲスト
AUTHORITY_USER  = 1   #   1：ユーザー
AUTHORITY_CHIEF = 50  #  50：長
AUTHORITY_ADMIN = 100 # 100：管理者

# 性別 sex
SEX_MALE   = 1 # 男性
SEX_FEMALE = 2 # 女性

module Constants
    ## Constants::NUMでアクセスできる
    NUM = 1
end

if Rails.env == "production"
    ## 本番の定数
else
    ## 開発の定数
end
