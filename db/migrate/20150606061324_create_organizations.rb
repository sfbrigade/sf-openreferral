class CreateOrganizations < ActiveRecord::Migration
  def change
    create_table :organizations do |t|
      t.string :name
      t.text :description
      t.string :address
      t.string :phone
      t.string :email
      t.string :url

      t.timestamps null: false
    end
  end
end
