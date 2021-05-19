class AddFieldsToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :phone, :integer
    add_column :users, :unit_number, :string
    add_column :users, :street_number, :string
    add_column :users, :street_name, :string
    add_column :users, :suburb, :string
    add_column :users, :state, :string
  end
end
