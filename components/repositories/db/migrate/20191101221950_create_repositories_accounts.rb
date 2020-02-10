class CreateRepositoriesAccounts < ActiveRecord::Migration[6.0]
  def change
    create_table :repositories_accounts do |t|
      t.uuid :uuid, default: 'uuid_generate_v4()', null: false, index: true
      t.string :email, index: true, unique: true, null: false

      t.string :provider, null: false, default: 'email'
      t.string :uid, null: false, default: ''

      t.string :password_digest

      t.integer :sign_in_count, default: 0, null: false

      t.string :nickname, index: true, unique: true, null: false
      t.timestamps
    end
  end
end
