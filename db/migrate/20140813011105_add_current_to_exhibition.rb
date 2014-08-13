class AddCurrentToExhibition < ActiveRecord::Migration
  def change
    add_column :exhibitions, :current, :boolean, default: false
  end
end
