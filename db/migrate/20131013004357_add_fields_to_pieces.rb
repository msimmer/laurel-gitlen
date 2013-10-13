class AddFieldsToPieces < ActiveRecord::Migration
  def change
    change_table :pieces do |t|
      t.rename :name, :title
      t.string :year
      t.string :dimensions
      t.string :edition_details
    end
  end
end

