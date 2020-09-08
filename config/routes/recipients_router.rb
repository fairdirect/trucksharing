require_relative "abstract_router"

class RecipientsRouter < AbstractRouter
  def draw
    @router.namespace :recipients do
      @router.resources :shipping_requests, only: [:index]
    end
  end
end
