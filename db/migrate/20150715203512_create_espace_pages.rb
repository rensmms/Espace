class CreateEspacePages < ActiveRecord::Migration
  def change
    create_table :espace_pages do |t|
      t.string :title
      t.text :text

      t.datetime :published_at

      t.datetime :deleted_at
      t.integer :created_by_id
      t.integer :updated_by_id
      t.integer :deleted_by_id
      t.timestamps null: false
    end
  end
end
