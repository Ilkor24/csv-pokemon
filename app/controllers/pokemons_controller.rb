require 'csv'

class PokemonsController < ApplicationController
  def index
    @pokemons = Pokemon.order(:pokedex_id)

    if params[:query].present?
      @pokemons = @pokemons.where('name ILIKE ?', "%#{params[:query]}%")
    end
  end

  def export_pokemons
    selected_pokemons = Pokemon.where(id: params[:pokemon_ids])
    respond_to do |format|
      format.html { send_data selected_pokemons.to_csv, filename: "selected_pokemons.csv" }
    end
  end
end
