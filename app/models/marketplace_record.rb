class MarketplaceRecord < ApplicationRecord
  self.abstract_class = true

  connects_to database: { writing: :marketplace_db, reading: :marketplace_db_replica }
end
