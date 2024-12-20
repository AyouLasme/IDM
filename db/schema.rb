# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[8.0].define(version: 2024_12_10_193135) do
  create_table "disponibilites", force: :cascade do |t|
    t.datetime "date_debut"
    t.datetime "date_fin"
    t.integer "piece_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["piece_id"], name: "index_disponibilites_on_piece_id"
  end

  create_table "materiels", force: :cascade do |t|
    t.string "nom"
    t.text "description"
    t.integer "quantites_disponible"
    t.integer "residence_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["residence_id"], name: "index_materiels_on_residence_id"
  end

  create_table "paiements", force: :cascade do |t|
    t.decimal "montant"
    t.datetime "date_paie"
    t.string "mode_paie"
    t.integer "reservation_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["reservation_id"], name: "index_paiements_on_reservation_id"
  end

  create_table "pieces", force: :cascade do |t|
    t.text "description"
    t.integer "capacite"
    t.integer "residence_id", null: false
    t.string "type_de_piece"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "type_de_piece_id", null: false
    t.index ["residence_id"], name: "index_pieces_on_residence_id"
    t.index ["type_de_piece_id"], name: "index_pieces_on_type_de_piece_id"
  end

  create_table "prestations", force: :cascade do |t|
    t.string "libelle"
    t.text "description"
    t.integer "residence_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["residence_id"], name: "index_prestations_on_residence_id"
  end

  create_table "reservations", force: :cascade do |t|
    t.datetime "date_debut"
    t.datetime "date_fin"
    t.string "statut"
    t.decimal "montant_global"
    t.integer "user_id", null: false
    t.integer "piece_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["piece_id"], name: "index_reservations_on_piece_id"
    t.index ["user_id"], name: "index_reservations_on_user_id"
  end

  create_table "residences", force: :cascade do |t|
    t.string "nom_de_la_residence"
    t.text "adresse"
    t.text "description"
    t.string "image"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "saisons", force: :cascade do |t|
    t.string "libelle"
    t.date "debut_saison"
    t.date "fin_saison"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tarifs", force: :cascade do |t|
    t.decimal "prix"
    t.integer "saison_id", null: false
    t.integer "piece_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["piece_id"], name: "index_tarifs_on_piece_id"
    t.index ["saison_id"], name: "index_tarifs_on_saison_id"
  end

  create_table "type_de_pieces", force: :cascade do |t|
    t.string "libelle"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "nom"
    t.string "prenom"
    t.string "email"
    t.string "mot_de_passe"
    t.string "role"
    t.text "adresse"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "disponibilites", "pieces"
  add_foreign_key "materiels", "residences"
  add_foreign_key "paiements", "reservations"
  add_foreign_key "pieces", "residences"
  add_foreign_key "pieces", "type_de_pieces"
  add_foreign_key "prestations", "residences"
  add_foreign_key "reservations", "pieces"
  add_foreign_key "reservations", "users"
  add_foreign_key "tarifs", "pieces"
  add_foreign_key "tarifs", "saisons"
end
