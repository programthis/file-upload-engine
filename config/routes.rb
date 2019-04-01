Rails.application.routes.draw do
  devise_for :users
	get 'welcome/index'

	resources :uploads do
	  member do
	    delete :delete_image_attachment
	  end
	end

	root 'uploads#new'
end
