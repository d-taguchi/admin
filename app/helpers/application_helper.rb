module ApplicationHelper

    ## グループを表示用に変換する
    def group_2_display_4_converting(group)
        case group
        when AUTHORITY_BAN then
            view = '禁止'
        when AUTHORITY_GUEST then
            view = 'ゲスト'
        when AUTHORITY_USER then
            view = 'ユーザー'
        when AUTHORITY_CHIEF then
            view = '長'
        when AUTHORITY_ADMIN then
            view = '管理者'
        else
            view = '謎'
        end
    end

    ## 性別を表示用に変換する
    def sex_2_display_4_converting(sex)
        case sex
        when SEX_MALE then
            view = '男性'
        when SEX_FEMALE then
            view = '女性'
        else
            view = '謎'
        end
    end
end
