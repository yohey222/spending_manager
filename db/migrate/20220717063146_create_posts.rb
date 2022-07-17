class CreatePosts < ActiveRecord::Migration[6.1]
  def change
    create_table :posts do |t|
      t.string :title
      t.date :spend_date
      t.integer :money

      t.timestamps
    end
  end
end
