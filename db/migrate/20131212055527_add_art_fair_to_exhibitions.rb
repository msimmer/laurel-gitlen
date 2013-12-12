class AddArtFairToExhibitions < ActiveRecord::Migration
  def change
    add_column :exhibitions, :art_fair, :boolean, default: false
  end
end
