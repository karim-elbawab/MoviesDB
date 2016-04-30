class CreateActings < ActiveRecord::Migration
  def change
    create_table :actings do |t|
      t.integer :actor_id
      t.integer :movie_id
      t.string :role

      t.timestamps null: false
    end
  end
end
