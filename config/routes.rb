Rails.application.routes.draw do
  get 'photos/index'

  get 'photos/new'

  get 'photos/edit'

  get 'photos/delete'

  devise_for :users, :controllers => { }
  root 'setup#index'
  get '/setup' => 'setup#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
