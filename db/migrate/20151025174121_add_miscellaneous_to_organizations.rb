class AddMiscellaneousToOrganizations < ActiveRecord::Migration
  def change
    add_column :organizations, :miscellaneous, :text
  end
end
