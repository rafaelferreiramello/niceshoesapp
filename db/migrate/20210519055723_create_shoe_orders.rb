class CreateShoeOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :shoe_orders do |t|
      t.references :shoe, null: false, foreign_key: true
      t.references :order, null: false, foreign_key: true

      t.timestamps
    end
  end
end
