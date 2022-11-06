class CreateRatings < ActiveRecord::Migration[7.0]
  def change
    create_table :ratings do |t|
      t.string :rated_object_id
      t.integer :value
      t.timestamps

      t.index :rated_object_id
    end
  end
end
