class CreateRepositoriesAuthenticationTokens < ActiveRecord::Migration[6.0]
  def change
    create_table :repositories_authentication_tokens do |t|
      t.uuid :account_uuid, foreign_key: true, index: {name: 'idx_account_on_token'}
      t.string :authentication_token, unique: true, null: false, index: {name: 'idx_value_on_token'}
      t.string :sign_in_ip
      t.timestamps
    end
  end
end
