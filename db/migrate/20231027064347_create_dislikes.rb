class CreateDislikes < ActiveRecord::Migration[6.1]
  def change
    create_table :dislikes do |t|

      t.references :user, foreign_key: true
      t.references :genre, foreign_key: true
      t.timestamps

    end
  end
end
