class RenameMotDePasseToEncryptedPassword < ActiveRecord::Migration[6.1]
  def change
    rename_column :users, :mot_de_passe, :encrypted_password
  end
end
