class CreateBooks < ActiveRecord::Migration[6.1]
  def change
    create_table :books do |t|
 
      t.references :user, foreign_key: true
      t.string :title, null:false
      t.text :explanation
      t.timestamps
    end

  end
end
