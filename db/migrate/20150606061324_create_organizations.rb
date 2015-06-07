class CreateOrganizations < ActiveRecord::Migration
  def change
    create_table :organizations do |t|
      t.string :name
      t.text :description
      t.string :address
      t.string :phones, array: true, default: []
      t.string :emails, array: true, default: []
      t.string :url
      t.string :languages, array: true, default: []

      t.timestamps null: false
    end
  end
end
