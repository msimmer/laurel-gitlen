class AddPressLinkToArtists < ActiveRecord::Migration
  def change
    add_column :artists, :press_url, :string
  end
end
