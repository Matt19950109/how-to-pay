Rails.application.routes.draw do
  # ユーザー管理
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions'
  }
  
  # トップページ
  root to: "tops#index"

  # 銀行名管理
  resources :banks, only:[:index, :new, :create]
  
  # 支出管理
  resources :spendings, only: :index
end
