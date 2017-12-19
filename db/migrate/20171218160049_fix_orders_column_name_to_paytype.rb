class FixOrdersColumnNameToPaytype < ActiveRecord::Migration[5.1]
  def change
    rename_column :orders, :emailpay_type, :pay_type
  end
end
