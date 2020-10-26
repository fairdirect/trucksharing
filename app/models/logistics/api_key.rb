require "securerandom"

module Logistics
  class ApiKey < LogisticsRecord
    self.table_name = "logistics_api_keys"

    validates :key, presence: true, uniqueness: true

    scope :active, -> { where(deprecated_at: nil) }

    after_initialize :generate_key

    private

    def generate_key
      self.key = SecureRandom.uuid if self.key.nil?
    end
  end
end
