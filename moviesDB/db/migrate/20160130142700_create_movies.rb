class CreateMovies < ActiveRecord::Migration
  def change
    create_table :movies do |t|
      t.string :name
      t.text :description
      t.string :image_url
      t.date :release_date
      t.integer :director_id
      t.float :rating, default: 0.0
    end
  end
end
