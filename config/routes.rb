Rails.application.routes.draw do
  
  resources :urlmappers do
	  collection do
	    get :redirected_site
	  end
	end
  root 'urlmappers#new'
  get '/:tinyurl', to: 'urlmappers#redirected_site'

end
