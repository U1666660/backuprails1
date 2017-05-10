class CreateUserPosts < ActiveRecord::Migration[5.0]
  def change
    create_table :userposts do |t|
      t.string :title
      t.text :content
      t.boolean :publish
      t.references :user, foreign_key: true

      t.timestamps null: false

    end
  end
end
