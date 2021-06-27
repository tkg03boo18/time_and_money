Rails.application.routes.draw do
  get 'users/show'
  get 'users/edit'
  devise_for :users
 root to: 'homes#top'
 get 'about' => 'homes#about'
end
