class LoadEpeliaSchema < ActiveRecord::Migration[6.0]
  def change
    connection = MarketplaceRecord.connection

    sql = File.read('db/marketplace_db/epelia.sql')
    statements = sql.split(/;$/)

    MarketplaceRecord.transaction do
      statements.each do |statement|
        connection.execute(statement)
      end
    end
  end
end
