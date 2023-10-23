class CreateGenres < ActiveRecord::Migration[6.1]
  def change
    create_table :genres do |t|

      t.integer :user_id
      t.string :name, null:false, uniqueness: true
      t.timestamps
    end
  end
end
