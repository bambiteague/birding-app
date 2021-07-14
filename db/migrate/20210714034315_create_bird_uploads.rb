class CreateBirdUploads < ActiveRecord::Migration[6.1]
  def change
    create_table :bird_uploads do |t|

      t.timestamps
    end
  end
end
