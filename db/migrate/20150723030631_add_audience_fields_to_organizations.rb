class AddAudienceFieldsToOrganizations < ActiveRecord::Migration
  def change
    add_column :organizations, :demographics, :string
    add_column :organizations, :fees, :string
    add_column :organizations, :accessibility, :string
  end
end
