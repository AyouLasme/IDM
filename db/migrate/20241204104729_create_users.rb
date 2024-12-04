class CreateUsers < ActiveRecord::Migration[8.0]
  def change
    create_table :users do |t|
      t.string :nom
      t.string :prenom
      t.string :email
      t.string :mot_de_passe
      t.string :role
      t.text :adresse

      t.timestamps
    end
  end
end



