class CreateJoinTableArtistsStories < ActiveRecord::Migration
  def change
    create_join_table :artists, :stories
  end
end
