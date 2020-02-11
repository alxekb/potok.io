class CreateRates < ActiveRecord::Migration[6.0]
  def change
    create_table :rates do |t|
      t.string :category, null: false
      t.references :from_currency, references: :currencies, null: false
      t.references :to_currency, references: :currencies, null: false
      t.decimal :buy, precision: 15, scale: 8
      t.decimal :sell, precision: 15, scale: 8

      t.timestamps
    end

    add_foreign_key :rates,
                     :currencies, column: :from_currency_id, primary_key: :code
    add_foreign_key :rates,
                     :currencies, column: :to_currency_id, primary_key: :code
  end
end
