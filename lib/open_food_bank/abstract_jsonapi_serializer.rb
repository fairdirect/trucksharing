require 'jsonapi/serializer'

module OpenFoodBank
  class AbstractJsonapiSerializer
    include JSONAPI::Serializer
  end
end
