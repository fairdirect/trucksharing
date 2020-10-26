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

      resource :system, only: [], controller: "systems/base" do
        get :ping
      end

      get "import_order/:order_number", to: "systems/shipping_requests#import"

      RecipientsRouter.new(self).draw
    end
  end
end
