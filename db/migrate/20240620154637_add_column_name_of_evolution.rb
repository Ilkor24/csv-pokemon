class AddColumnNameOfEvolution < ActiveRecord::Migration[7.1]
  def change
    add_column :pokemons, :name_of_evolution, :string
    add_column :pokemons, :name_of_previous_form, :string
  end
end
