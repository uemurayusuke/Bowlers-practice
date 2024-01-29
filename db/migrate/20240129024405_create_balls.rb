class CreateBalls < ActiveRecord::Migration[6.1]
  def change
    create_table :balls do |t|

      t.integer :maker, null: true
      t.integer :name, null: false
      t.text :caption, null: false
      t.integer :user_id
      t.timestamps
    end
  end
end
