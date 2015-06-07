class NonNullOrganizationArrays < ActiveRecord::Migration
  def up
    options = { array: true, default: [], null: false }

    [:emails, :languages, :phones].each do |attr|
      change_column :organizations, attr, :string, options
    end
  end

  def down
    options = { array: true, default: [], null: true }

    [:emails, :languages, :phones].each do |attr|
      change_column :organizations, attr, :string, options
    end
  end
end
