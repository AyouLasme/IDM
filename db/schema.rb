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

ActiveRecord::Schema[8.0].define(version: 2024_12_04_105110) do
  create_table "pieces", force: :cascade do |t|
    t.text "description"
    t.integer "capacite"
    t.integer "residence_id", null: false
    t.string "type_de_piece"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["residence_id"], name: "index_pieces_on_residence_id"
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

  create_table "users", force: :cascade do |t|
    t.string "nom"
    t.string "prenom"
    t.string "email"
    t.string "mot_de_passe"
    t.string "role"
    t.text "adresse"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "pieces", "residences"
  add_foreign_key "reservations", "pieces"
  add_foreign_key "reservations", "users"
end
