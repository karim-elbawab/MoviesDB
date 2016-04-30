class CreateDirectors < ActiveRecord::Migration
  def change
    create_table :directors do |t|
      t.string :name
      t.string :image_url 
      t.text :description
      t.date :birthdate
      t.string :birthplace
    end
  end
end
