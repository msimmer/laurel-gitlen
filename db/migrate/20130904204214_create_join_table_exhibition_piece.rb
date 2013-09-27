class CreateJoinTableExhibitionPiece < ActiveRecord::Migration
  def change
    create_join_table :exhibitions, :pieces, table_name: :displays
  end
end
