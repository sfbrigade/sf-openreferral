class AddStatusToOrganizations < ActiveRecord::Migration
  def change
    add_column :organizations, :status, :string, null: false, default: "pending"
  end
end
