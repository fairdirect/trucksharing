require "securerandom"

module Marketplace
  class Country < MarketplaceRecord
    # To understand this table, one must look at the "id" field. It is a text field.
    # The creator of this table decided that the country symbol, which is eg. "DE"
    # can be used as a primary key, so remember that while working on this table.
    self.table_name = "epelia_countries"
  end
end
