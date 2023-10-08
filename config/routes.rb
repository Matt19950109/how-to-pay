Rails.application.routes.draw do
  # ユーザー管理
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions'
  }
  
  # トップページ
  root to: "tops#index"

  # 銀行名管理
  
  # 支出管理
  resources :spendings, only: :index
end
