class CreateEspaceUsers < ActiveRecord::Migration
  def change
    create_table :espace_users do |t|
      t.string :name

      t.timestamps null: false
    end
  end
end
