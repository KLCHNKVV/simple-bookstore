class CreateOrders < ActiveRecord::Migration[5.1]
  def change
    create_table :orders do |t|
      t.string :name
      t.text :address
      t.integer :emailpay_type

      t.timestamps
    end
  end
end
