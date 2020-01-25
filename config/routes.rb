Rails.application.routes.draw do
 	get 'settings/index'
 	devise_for :users, controllers: { registrations: 'users/registrations' }
	get 'welcome/index'

	authenticate :user do
		resources :uploads do
		  member do
		    delete :delete_image_attachment
		    get "file/:file_id", to: "uploads#show_file", as: "single"
		  end
		end
		resources :tags
		root 'uploads#new'

		namespace :admin do
			resources :settings do
				member do
				  get :toggle_user_admin
				  get :delete_tag
				end
			end
			resources :tags
		end

		devise_scope :user do
			get 'users', to: 'devise/registrations#new'
			get 'users/password', to: 'devise/password#new'
			put 'update_avatar', to: 'users/registrations#update_avatar'
		end
	end

	namespace :api, defaults: {format: 'json'} do
		namespace :v1 do
			resources :uploads do
				member do
					delete :delete_multiple_files
				end
			end
		end
	end
end
