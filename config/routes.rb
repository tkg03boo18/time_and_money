Rails.application.routes.draw do


 devise_for :users, path: 'user', controllers: {
    sessions: "users/sessions",
    registrations: "users/registrations",
    passwords: "users/passwords"
  }

 root to: 'homes#top'
 get 'about' => 'homes#about'

 get 'users/mypage'
 get 'users/show'
 get 'users/edit' => 'users#edit'
 patch 'users' => 'users#update'
 get 'users/unsubscribe'
 patch 'users/withdraw' => 'users#withdraw'
 patch 'plans/:id/calendarupdate' => 'plans#calendarupdate'
 get 'books/mypage' => 'books#mypage'
 resources :books, only: [:index, :show, :create, :edit, :update, :destroy]
 resources :budget_plans, only: [:index, :show, :create, :edit, :update, :destroy]
 resources :main_categories, only: [] do
    resources :sub_categories, only: :index
  end

 resources :plans, only: [:index, :create, :edit, :update, :destroy]
 resources :tasks, only: [:index, :show, :create, :edit, :update, :destroy]
 resources :lists, only: [:index, :show, :create, :edit, :update, :destroy]


end
