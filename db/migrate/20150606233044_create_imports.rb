class CreateImports < ActiveRecord::Migration
  def change
    create_table :imports do |t|
      t.string :data_url, null: false

      t.timestamps null: false
    end

    change_table :organizations do |t|
      t.references :import
    end
  end
end
