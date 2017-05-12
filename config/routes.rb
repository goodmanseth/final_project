Rails.application.routes.draw do

  devise_for :users, :controllers => { :registrations => "my_devise/registrations" }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'health_data#index'
  get '/about' => 'health_data#about'
  get '/visualize' => 'health_data#visualize'
  resources :health_data do
    resources :reviews
  end
  resources :activities

end
