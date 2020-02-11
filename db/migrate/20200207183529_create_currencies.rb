class CreateCurrencies < ActiveRecord::Migration[6.0]
  def change
    create_table :currencies, id: false do |t|
      t.primary_key :code, null: false, unique: true
      t.string :name
      t.string :str_code

      t.timestamps
    end
  end
end
