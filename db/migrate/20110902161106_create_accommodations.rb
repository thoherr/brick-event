class CreateAccommodations < ActiveRecord::Migration[4.2]
  def change
    create_table :accommodations do |t|
      t.integer :attendance_id
      t.integer :accommodation_type_id
      t.integer :count
      t.string :remarks

      t.timestamps
    end
  end
end
