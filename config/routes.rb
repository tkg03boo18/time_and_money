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

 resources :plans
 resources :tasks
 resources :categories, only: [:index, :create, :edit, :update]

end
