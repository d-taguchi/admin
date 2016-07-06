class Ability
    include CanCan::Ability

    ## 権限設定
    def initialize(manager)
        manager ||= Manager.new

        # manager.groupにて振り分け
        case manager.group
        when AUTHORITY_BAN then # -1：禁止
            can :manage, :all
        when AUTHORITY_GUEST then # 0：ゲスト
            can :manage, :all
        when AUTHORITY_USER then # 1：ユーザー
            can :manage, :all
        when AUTHORITY_CHIEF then  # 50：長
            can :manage, :all
        when AUTHORITY_ADMIN then # 100：管理者
            # can :manage, :all
            can :read, [User]
        else
            can :manage, :all
        end
    end













    # def initialize(user)
    #     user ||= Manager.new  # ログインしていない場合は、からユーザーを用意し判定に用いる
    #
    #     # default parmission
    #     cannot :destroy, User
    #
    #     # if manager.sys_admin?
    #     #     can :manage, :all
    #     # end
    #     #
    #     # if manager.product_manager?
    #     #     can :manage, Stockpile, owner: manager # 自分がオーナーの倉庫には全権限を持つ
    #     #     can :read, Stockpile                 # そうでなくても、読み取り権限を持つ
    #     #
    #     #     # 自分の倉庫にある製品に対してすべての権限を持つ
    #     #     can :manage, Product, stockpile: {owner: manager}
    #     #     # ただし、新規登録、削除はできない
    #     #     cannot [:create, :destroy], Product
    #     # end
    #     #
    #     # if manager.customer?
    #     #     # 複数のモデルに権限を付与できる
    #     #     can :read, [Stockpile, Product]
    #     #
    #     #     # 独自権限も作れる
    #     #     can :buy, Procuct, stockpile: nil # 倉庫から出されている製品を買える
    #     # end
    # end
end
