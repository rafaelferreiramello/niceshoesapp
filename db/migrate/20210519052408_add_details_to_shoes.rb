class AddDetailsToShoes < ActiveRecord::Migration[6.1]
  def change
    add_column :shoes, :name, :string
    add_column :shoes, :price, :decimal
    add_column :shoes, :description, :string
    add_column :shoes, :stock, :integer
  end
end
