# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
# db/seeds.rb
require 'open-uri'
require 'json'

def fetch_data(url)
  response = URI.open(url).read
  JSON.parse(response)
end

def seed_pokemon_data
  generation_url = 'https://pokeapi.co/api/v2/generation/1'
  generation_data = fetch_data(generation_url)

  generation_data['pokemon_species'].each do |species|
    species_url = species['url']
    species_data = fetch_data(species_url)
    pokemon_data = fetch_data("https://pokeapi.co/api/v2/pokemon/#{species_data['id']}")

    french_name = species_data['names'].find { |name| name['language']['name'] == 'fr' }['name']
    id = species_data['id']
    sprite = pokemon_data['sprites']['front_default']
    sprite_shiny = pokemon_data['sprites']['front_shiny']

    tipes = []
    pokemon_data['types'].each do |type_info|
      tipes << type_info['type']['name']
    end

    evolution_data = fetch_data(species_data['evolution_chain']['url'])

    evolutions_ids = []
    chain = evolution_data['chain']
    collect_evolution_ids(chain, evolutions_ids)

    Pokemon.create(
      name: french_name,
      pokedex_id: id,
      url_regular: sprite,
      url_shiny: sprite_shiny,
      types: tipes,
      evolutions_id: evolutions_ids
    )
  end
end

def collect_evolution_ids(chain, evolutions_ids)
  chain['evolves_to'].each do |evolution|
    evolutions_ids << evolution['species']['name']
    collect_evolution_ids(evolution, evolutions_ids) if evolution['evolves_to'].any?
  end
end

seed_pokemon_data
