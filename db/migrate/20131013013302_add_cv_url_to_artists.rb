class AddCvUrlToArtists < ActiveRecord::Migration
  def change
    add_column :artists, :cv_url, :string
  end
end
