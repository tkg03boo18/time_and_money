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
 resources :books
 resources :budget_plans
 resources :main_categories, only: [] do
    resources :sub_categories, only: :index
  end

 resources :plans
 resources :tasks
 resources :lists


end
