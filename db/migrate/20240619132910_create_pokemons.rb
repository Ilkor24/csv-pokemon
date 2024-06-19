class CreatePokemons < ActiveRecord::Migration[7.1]
  def change
    create_table :pokemons do |t|
      t.integer :pokedex_id
      t.string :name
      t.string :url_regular
      t.string :url_shiny
      t.string :type
      t.integer :evolutions_id

      t.timestamps
    end
  end
end
