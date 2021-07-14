class AddColumnToBirds < ActiveRecord::Migration[6.1]
  def change
    add_column :birds, :species, :string
    add_column :birds, :visual_description, :text
    add_column :birds, :call_description, :text
    add_column :birds, :quantity, :integer
  end
end
