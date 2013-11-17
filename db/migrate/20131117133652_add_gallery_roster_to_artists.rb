class AddGalleryRosterToArtists < ActiveRecord::Migration
  def change
    add_column :artists, :gallery_roster, :boolean, default: true
  end
end
