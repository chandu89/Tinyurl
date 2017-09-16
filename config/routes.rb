Rails.application.routes.draw do
  
  resources :urlmappers
  root 'urlmappers#new'
  get '/:tinyurl', to: 'urlmappers#index'

end
