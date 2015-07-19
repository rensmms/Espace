class CreateEspaceComments < ActiveRecord::Migration
  def change
    create_table :espace_comments do |t|
      t.integer :page_id
      t.text :text
      t.datetime :deleted_at
      t.integer :created_by_id

      t.timestamps null: false
    end
  end
end
