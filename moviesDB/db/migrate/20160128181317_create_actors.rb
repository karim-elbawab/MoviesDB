class CreateActors < ActiveRecord::Migration
  def change
    create_table :actors do |t|
      t.string :name
      t.text :description
      t.string :image_url
      t.date :birthdate
      t.string :birthplace
    end
  end
end
