class CreateArtistsExhibitions < ActiveRecord::Migration
  def change
    create_table :artists_exhibitions do |t|
      t.belongs_to :artist
      t.belongs_to :exhibition
    end
  end
end
