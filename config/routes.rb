Rails.application.routes.draw do
#  scope "(:locale)", locale: /#{I18n.available_locales.map(&:to_s).join('|')}/ do
#    resources :freetimes
#    resources :users
#    resources :bookings

#  end

  devise_for :users
  root :controller => 'freetimes', :action => 'index'
  get 'meets' => 'freetimes#index' #トップページ
  get 'users' => 'users#index' #マイページ
  get 'freetimes/new' => 'freetimes#new' #freetime登録画面
  get 'freetimes/show' => 'freetimes#show' #登録したfreetime一覧表示
  get 'freetimes/edit/:id' => 'freetimes#edit' #登録したfreetimeの編集
  patch 'freetimes/edit/:id' => 'freetimes#update' #編集したfreetimesの反映
  post 'freetimes' => 'freetimes#create' #freetime投稿データのdb保存
  delete 'freetimes/:id' => 'freetimes#destroy' #freetimeの削除
  get 'freetimes/search' => 'freetimes#search' #freetime検索画面
  get 'users/show/:id' => 'users#show'
  get 'bookings/new/:id' => 'bookings#new'  #オファーの登録
#  delete 'users/retire' => 'users#destroy' #ユーザー退会

end
