Rails.application.routes.draw do
  resources :cities, :only => [:index, :show] do
    scope module: :cities do
      resources :weathers, :except => [:index, :show] 
    end
    collection do
      get :update_temps
    end
  end
  root :to => "cities#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
