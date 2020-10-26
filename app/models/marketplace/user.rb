require "securerandom"

module Marketplace
  class User < MarketplaceRecord
    MOCKED_RECIPIENT_TOKEN = "2e48afa0-ad6b-424b-b216-6ed41213d98a".freeze
    MOCKED_SERVICE_PROVIDER_TOKEN = "793cc4bd-99cc-4a54-9cdc-2fb2865ee90a".freeze

    RECIPIENT_ROLE_NAME = "recipient".freeze
    SERVICE_PROVIDER_ROLE_NAME = "service_provider".freeze

    MOCKED_RECIPIENT_EMAIL = "mocked_recipient@ofb.com".freeze
    MOCKED_SERVICE_PROVIDER_EMAIL = "mocked_service_provider@ofb.com".freeze
    self.table_name = "epelia_users"

    self.inheritance_column = nil

    has_many :orders, class_name: 'Marketplace::Order'
    has_many :shops, class_name: 'Marketplace::Shop'
    has_many :adresses, class_name: 'Marketplace::Address'

    def self.find_by_token!(token)
      case token
      when MOCKED_RECIPIENT_TOKEN
        mocked_recipient(token)
      when MOCKED_SERVICE_PROVIDER_TOKEN
        mocked_service_provider(token)
      else
        raise ActiveRecord::RecordNotFound
      end
    end

    def self.mocked_recipient(token)
      find_by_email(MOCKED_RECIPIENT_EMAIL) || create_mocked_recipient
    end

    def self.mocked_service_provider(token)
      find_by_email(MOCKED_SERVICE_PROVIDER_EMAIL) || create_mocked_service_provider
    end

    def self.create_mocked_recipient
      create!(phpbb_id: "asdfqwer1234",
              email: MOCKED_RECIPIENT_EMAIL,
              password: SecureRandom.hex,
              salt: SecureRandom.hex,
              type: RECIPIENT_ROLE_NAME)
    end

    def self.create_mocked_service_provider
      create!(phpbb_id: "asdfqwer1234",
              email: MOCKED_SERVICE_PROVIDER_EMAIL,
              password: SecureRandom.hex,
              salt: SecureRandom.hex,
              type: SERVICE_PROVIDER_ROLE_NAME)
    end

    def recipient?
      type == RECIPIENT_ROLE_NAME
    end

    def service_provider?
      type == SERVICE_PROVIDER_ROLE_NAME
    end
  end
end
