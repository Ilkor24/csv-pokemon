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

ActiveRecord::Schema[7.1].define(version: 2024_06_20_154637) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "pokemons", force: :cascade do |t|
    t.integer "pokedex_id"
    t.string "name"
    t.string "url_regular"
    t.string "url_shiny"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "types", default: [], array: true
    t.integer "evolutions_id", default: [], array: true
    t.string "name_of_evolution"
    t.string "name_of_previous_form"
  end

end
