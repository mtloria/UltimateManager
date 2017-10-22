Rails.application.routes.draw do

	root to: 'home#show'

	mount_devise_token_auth_for 'Admin', at: 'admin_auth', controllers: {
		registrations: 'admin/registrations'
	}
	
	mount_devise_token_auth_for 'User', at: 'auth', controllers: {
		registrations: 'user/registrations'
	}

  scope module: 'api' do
	  namespace :v1 do
	    resources :users, only: [:index, :show]
	  end
	end

end
