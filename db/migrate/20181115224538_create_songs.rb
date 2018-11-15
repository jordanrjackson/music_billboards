class CreateSongs < ActiveRecord::Migration[5.2]
  def change
    create_table :songs do |t|
      t.string :name
      t.string :artist
      t.string :description
      t.string :release
      t.string :year
      t.belongs_to :artists, foreign_key: true
      t.belongs_to :billboards, foreign_key: true

      t.timestamps
    end
  end
end
