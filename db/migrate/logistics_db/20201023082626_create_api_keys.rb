class CreateApiKeys < ActiveRecord::Migration[6.0]
  def change
    create_table :logistics_api_keys do |t|
      t.string :key, null: false, unique: true
      t.datetime :deprecated_at
      t.timestamps
    end
  end
end
