class DeviseCreateAdmins < ActiveRecord::Migration
  def change
    create_table(:admins) do |t|
      t.string :email, null: false, default: ""
      t.string :encrypted_password, null: false, default: ""
      t.integer :sign_in_count, default: 0, null: false
      t.datetime :current_sign_in_at
      t.datetime :last_sign_in_at
      t.inet :current_sign_in_ip
      t.inet :last_sign_in_ip
      t.integer :failed_attempts, default: 0, null: false
      t.string :unlock_token, default: ""
      t.datetime :locked_at
      t.timestamps null: false
    end

    add_index :admins, :email, unique: true
    add_index :admins, :unlock_token, unique: true
  end
end
