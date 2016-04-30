class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.belongs_to :user, index: true, foreign_key: true
      t.belongs_to :movie, index: true, foreign_key: true
      t.string :description
      t.integer :rating

      t.timestamps null: false
    end
  end
end
