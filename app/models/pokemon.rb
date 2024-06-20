class Pokemon < ApplicationRecord
  def self.to_csv
    attributes = %w(name pokedex_id url_regular url_shiny types evolutions_id)
    CSV.generate(headers: true, col_sep: ';') do |csv|
      csv << attributes
      all.each do |pokemon|
        types = pokemon.types.join(', ')
        evolutions = pokemon.evolutions_id.join(', ')
        csv << [pokemon.name, pokemon.pokedex_id, pokemon.url_regular, pokemon.url_shiny, types, evolutions]
      end
    end
  end
end
