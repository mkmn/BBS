class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.string :poster, null: false
      t.string :email
      t.text :body, null: false
      
      t.references :topic, null: false

      t.timestamps
    end
  end
end
