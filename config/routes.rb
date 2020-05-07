Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :blacklists

      resources :events do
        resources :event_guests
        resources :event_images
        resources :event_pdfs
        resources :event_videos
        resources :comments, shallow: true do
          resources :replies
        end
      end

      resources :organization do
        resources :events
        resources :organization_admins
        resources :organization_members
      end

      resources :registered_users do
        resources :user_profiles
        resources :blacklists
        resources :events
        resources :messages
        resources :comments, shallow: true do
          resources :replies
        end
      end
      
      resource :system_administrators do
        resources :registered_users
      end
    end
  end
end
