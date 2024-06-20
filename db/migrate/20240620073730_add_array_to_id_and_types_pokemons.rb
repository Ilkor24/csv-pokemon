class AddArrayToIdAndTypesPokemons < ActiveRecord::Migration[7.1]
  def change
    remove_column :pokemons, :types
    remove_column :pokemons, :evolutions_id
    add_column :pokemons, :types, :text, array: true, default: []
    add_column :pokemons, :evolutions_id, :integer, array: true, default: []
  end
end
