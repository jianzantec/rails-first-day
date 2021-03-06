Rails.application.routes.draw do
  resources :home
  resources :common do
    collection do
      post :upload
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api do
    namespace :v1 do
      resources :grades do
        collection do
        end
      end
      resources :members do
        collection do
          post :login
        end
      end
      resources :rows do
        collection do
        end
      end
      resources :cols do
        collection do
        end
      end
      resources :students do
        collection do
        end
      end
    end
  end
end
