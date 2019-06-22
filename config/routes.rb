Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
root 'homes#top'
resources :books
resources :users
get '/home/about' => 'homes#about'
get 'homes/top'   => 'homes#top'

end

