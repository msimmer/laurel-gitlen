class AddPieceOrderToArtists < ActiveRecord::Migration
  def change
    add_column :artists, :piece_order, :string
  end
end
