class LogisticsRecord < ApplicationRecord
  self.abstract_class = true

  connects_to database: { writing: :logistics_db, reading: :logistics_db_replica }
end
