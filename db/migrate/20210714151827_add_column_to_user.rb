class AddColumnToUser < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :name, :string
    add_column :users, :age, :integer
    add_column :users, :username, :string
    add_column :users, :email, :text
    add_column :users, :location, :string
  end
end
