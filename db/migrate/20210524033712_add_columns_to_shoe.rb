class AddColumnsToShoe < ActiveRecord::Migration[6.1]
  def change
    add_column :shoes, :brand, :string
    add_column :shoes, :size, :integer
  end
end
