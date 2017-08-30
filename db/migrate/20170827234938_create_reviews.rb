class CreateReviews < ActiveRecord::Migration[5.1]
  def change
    create_table :reviews do |t|
      t.string :first_name
      t.string :surname
      t.integer :rating
      t.text :short_opinion
      t.references :film, foreign_key: true

      t.timestamps
    end
  end
end
