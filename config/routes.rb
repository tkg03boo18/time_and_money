Rails.application.routes.draw do


 devise_for(
  :users,
  path: 'user',
  module: 'devise'
  )

 root to: 'homes#top'
 get 'about' => 'homes#about'

 get 'users/mypage'
 get 'users/mymenu'
 get 'users/show'
 get 'users/edit' => 'users#edit'
 patch 'users' => 'users#update'
 get 'users/unsubscribe'
 patch 'users/withdraw' => 'users#withdraw'

 resources :books
 resources :budget_plans
 resources :main_categories, only: [] do
    resources :sub_categories, only: :index
  end

 resources :plans
 resources :tasks
 resources :lists


end
