Rails.application.routes.draw do
  devise_for :users
  root :controller => 'users', :action => 'index'
  get 'meets' => 'users#index'
  get 'meets/new' => 'freetime#create'
end
