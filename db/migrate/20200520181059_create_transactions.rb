class CreateTransactions < ActiveRecord::Migration[6.0]
  def change
    create_table :transactions do |t|
      t.string :fiat_currency
      t.decimal :fiat_value, precision: 8, scale: 2
      t.string :crypto_currency
      t.decimal :crypto_price, precision: 8, scale: 2
      t.timestamps
    end
  end
end
