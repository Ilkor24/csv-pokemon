class CreatePokemons < ActiveRecord::Migration[7.1]
  def change
    create_table :pokemons do |t|
      t.integer :pokedex_id
      t.string :name
      t.string :url_regular
      t.string :url_shiny
      t.string :types, array: true, default: []
      t.integer :evolutions_id, array: true, default: []
      t.timestamps
    end
  end
end
