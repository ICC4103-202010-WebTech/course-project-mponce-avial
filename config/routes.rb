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
          resources :replies, shallow: true
        end
      end

      resources :messages
    end
  end
end
