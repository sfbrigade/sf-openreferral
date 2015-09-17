class DropImports < ActiveRecord::Migration
  def change
    drop_table :imports do |t|
      t.string :data_url, null: false

      t.timestamps null: false
    end

    remove_column :organizations, :import_id, :integer
  end
end
