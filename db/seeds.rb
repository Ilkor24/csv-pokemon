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
# db/seeds.rb

# require 'open-uri'
# require 'json'

# def fetch_data(url)
#   response = URI.open(url).read
#   JSON.parse(response)
# end

# def seed_pokemon_data
#   generation_url = 'https://pokeapi.co/api/v2/generation/1'
#   generation_data = fetch_data(generation_url)

#   generation_data['pokemon_species'].each do |species|
#     species_data = fetch_data(species['url'])
#     pokemon_data = fetch_data("https://pokeapi.co/api/v2/pokemon/#{species_data['id']}")

#     french_name = species_data['names'].find { |name| name['language']['name'] == 'fr' }['name']
#     id = species_data['id']
#     sprite = pokemon_data['sprites']['front_default']
#     sprite_shiny = pokemon_data['sprites']['front_shiny']
#     types = pokemon_data['types'].map { |type_info| type_info['type']['name'] }

#     evolutions_ids = collect_evolution_ids(species_data['evolution_chain']['url'])

#     evolutions_ids -= [id] if evolutions_ids.include?(id)

#     Pokemon.create(
#       name: french_name,
#       pokedex_id: id,
#       url_regular: sprite,
#       url_shiny: sprite_shiny,
#       types: types,
#       evolutions_id: evolutions_ids
#     )
#   end
# end

# def collect_evolution_ids(evolution_chain_url)
#   evolution_data = fetch_data(evolution_chain_url)
#   chain = evolution_data['chain']
#   collect_chain_evolution_ids(chain)
# end

# def collect_chain_evolution_ids(chain)
#   evolutions_ids = []
#   collect_first_evolution_ids(chain['evolves_to'], evolutions_ids) if chain['evolves_to']
#   evolutions_ids
# end

# def collect_first_evolution_ids(evolution_array, evolutions_ids)
#   evolution_array.each do |evolution|
#     evolutions_ids << extract_pokemon_id(evolution['species']['url'])
#     collect_second_evolution_ids(evolution['evolves_to'], evolutions_ids) if evolution['evolves_to']
#   end
# end

# def collect_second_evolution_ids(evolution_array, evolutions_ids)
#   evolution_array&.each do |evolution|
#     evolutions_ids << extract_pokemon_id(evolution['species']['url'])
#   end
# end

# def extract_pokemon_id(pokemon_url)
#   pokemon_data = fetch_data(pokemon_url)
#   pokemon_data['id']
# end

# seed_pokemon_data
