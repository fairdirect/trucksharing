require 'sidekiq/web'

require_relative "routes/recipients_router"

Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  mount Sidekiq::Web => '/sidekiq'
  namespace :api do
    namespace :v1 do
      resource :user, only: [] do
        get :profile
      end

      resource :recipient, only: [], controller: "recipients/base" do
        get :authorised
      end

      resource :service_provider, only: [], controller: "service_providers/base" do
        get :authorised
      end

      RecipientsRouter.new(self).draw
    end
  end
end
