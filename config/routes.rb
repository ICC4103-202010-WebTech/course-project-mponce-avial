Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root "pages#home"

  get '/inbox/', to: 'inbox#show'

  get '/search', to: 'pages#search'

  get '/upload_files', to: 'events#upload_files'

  get '/pdf', to: 'events#pdf'

  get '/images', to: 'events#images'

  get '/videos', to: 'events#videos'

  post 'events/:events_id', to: "events#create_comment"

  #Admin namespace
  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :blacklists
      resources :inbox, only: [:show]

      resources :events do
        resources :event_guests
        resources :event_images
        resources :event_pdfs
        resources :event_videos
        resources :comments do
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

  ###############################################################
  #System administrator namespace
  namespace :admin do

    resources :organizations do
      resources :events
      resources :organization_admins
      resources :organization_members
    end

    resources :events do
      resources :event_guests
      resources :event_images
      resources :event_pdfs
      resources :event_videos
    end

    resources :comments
    resources :replies

  end

  #################################################################################
  # #Default namespace

  resources :blacklists
  resources :inbox, only: [:show]

  resources :events do
    resources :event_guests
    resources :event_images
    resources :event_pdfs
    resources :event_videos
  end

  resources :organizations do
    resources :events
    resources :organization_admins
    resources :organization_members
  end

  resources :user_profiles do
    resources :registered_users
  end

  resource :system_administrators do
    resources :registered_users
  end

  resources :inbox, defaults: { format: :html }
  resources :system_administrators, defaults: { format: :html }
  resources :registered_users, defaults: { format: :html }
  resources :user_profiles, defaults: { format: :html }
  resources :events, defaults: { format: :html }
  resources :messages, defaults: { format: :html }
  resources :comments, defaults: { format: :html }
  resources :replies, defaults: { format: :html }
  resources :organizations, defaults: { format: :html }
  resources :organization_admins, defaults: { format: :html }
  resources :organization_members, defaults: { format: :html }
  resources :event_guests, defaults: { format: :html }
  resources :event_images, defaults: { format: :html }
  resources :event_pdfs, defaults: { format: :html }
  resources :event_videos, defaults: { format: :html }
  resources :blacklists, defaults: { format: :html }
end
