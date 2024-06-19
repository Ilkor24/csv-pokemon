class ChangeTypeOfFieldTypeEvolutionPokemons < ActiveRecord::Migration[7.1]
  def change
    remove_column :pokemons, :type
    remove_column :pokemons, :evolutions_id
  end
end
