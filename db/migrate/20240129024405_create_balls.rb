class CreateBalls < ActiveRecord::Migration[6.1]
  def change
    create_table :balls do |t|

      t.string :maker, null: true
      t.string :name, null: false
      t.text :caption, null: false
      t.float :rate, null: false
      t.integer :user_id
      t.timestamps
    end
  end
end
