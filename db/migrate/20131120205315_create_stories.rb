class CreateStories < ActiveRecord::Migration
  def change
    create_table :stories do |t|
      t.text :story
      t.date :date
      t.timestamps
    end
  end
end
