class AddColumnToSightings < ActiveRecord::Migration[6.1]
  def change
    add_column :sightings, :location, :text
    add_column :sightings, :date_spotted, :string
    add_column :sightings, :user_id, :integer
    add_column :sightings, :bird_id, :integer
  end
end
