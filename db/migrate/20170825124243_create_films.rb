class CreateFilms < ActiveRecord::Migration[5.1]
  def change
    create_table :films do |t|
      t.string :title
      t.date :release_date
      t.integer :duration
      t.text :short_description
      t.string :genre
      t.string :director
      t.string :scenarist
      t.string :country

      t.timestamps
    end
  end
end
