class CreateExhibitions < ActiveRecord::Migration
  def change
    create_table :exhibitions do |t|
      t.date :begins
      t.date :ends
      t.string :name
      t.string :press_release
      t.string :piece_order
      t.string :artist_order
      t.text :description

      t.timestamps
    end
  end
end
