# frozen_string_literal: true

require 'csv'
require 'open-uri'
require 'json'

class PokemonsController < ApplicationController
  def index
    pokemon
    @pokemons = Pokemon.order(:pokedex_id)
    # instead of using if params[:query].present?/rubocop advice
    return unless params[:query].present?

    @pokemons = @pokemons.where('name ILIKE ?', "%#{params[:query]}%")
  end

  def export_pokemons
    selected_pokemons = Pokemon.where(id: params[:pokemon_ids])
    respond_to do |format|
      format.html { send_data selected_pokemons.to_csv, filename: 'selected_pokemons.csv' }
    end
  end

  private

  def pokemon
    Pokemon.destroy_all
    data = JSON.parse(URI.open('https://tyradex.vercel.app/api/v1/pokemon').read)

    data.each do |pokemon|
      next unless pokemon['generation'] == 1
        french_name = pokemon['name']['fr']
        id = pokemon['pokedex_id']
        sprite = pokemon['sprites']['regular']
        sprite_shiny = pokemon['sprites']['shiny']
        types = []
        evolve_next = []
        evolve_previous = []
        evolve = nil
        previous = nil

      # instead of using if pokemon['types']/rubocop advice
      pokemon['types']&.each do |type|
        types << type['name']
      end

      if pokemon['evolution'] && pokemon['evolution']['next']
        pokemon['evolution']['next'].each do |evolution|
          if evolution['pokedex_id'] <= 151
            evolve_next << evolution['pokedex_id']
            evolve = evolution['name']
          end
        end
      end

      if pokemon['evolution'] && pokemon['evolution']['pre']
        pokemon['evolution']['pre'].each do |evolution|
          if evolution['pokedex_id'] <= 151
            evolve_previous << evolution['pokedex_id']
            previous = evolution['name']
          end
        end
      end

      evolutions_ids = evolve_previous + evolve_next

      Pokemon.create(
        name: french_name,
        pokedex_id: id,
        url_regular: sprite,
        url_shiny: sprite_shiny,
        types: types,
        evolutions_id: evolutions_ids,
        name_of_evolution: evolve,
        name_of_previous_form: previous
        )
    end
    Pokemon.first.destroy
  end
end
