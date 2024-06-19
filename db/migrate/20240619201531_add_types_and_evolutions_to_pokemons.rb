class AddTypesAndEvolutionsToPokemons < ActiveRecord::Migration[7.1]
  def change
    add_column :pokemons, :types, :text
    add_column :pokemons, :evolutions_id, :text
  end
end
