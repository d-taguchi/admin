Rails.application.routes.draw do
    # root
    root 'dashboard#index'

    # controller
    Rails.application.routes.draw do
        resources :partners
        resources :users
        resources :widgets, only: [:index] # 部品
        # resources :table, only: [:index] # テーブル
        resources :table # テーブル
        resources :auth # 認証
    end

    # 認証系
    # controller auth do
    #     get 'index' => :index
    #     post 'index' => :auth
    #     delete 'logout' => :destroy
    # end

    # resources :widgets do
    #     get 'index' #追加したいアクション
    # end
end
