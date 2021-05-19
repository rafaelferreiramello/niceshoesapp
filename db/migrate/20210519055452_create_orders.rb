class CreateOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :orders do |t|
      t.decimal :total_ammount
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
