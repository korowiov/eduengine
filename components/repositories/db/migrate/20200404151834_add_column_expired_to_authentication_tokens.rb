class AddColumnExpiredToAuthenticationTokens < ActiveRecord::Migration[6.0]
  def change
    add_column :repositories_authentication_tokens, :expired, :boolean, default: false
  end
end
