class Pokemon < ApplicationRecord
  def self.to_csv
    attributes = %w(pokedex_id name url_regular url_shiny types evolutions_id)
    CSV.generate(headers: true, col_sep: ';') do |csv|
      csv << attributes
      all.each do |pokemon|
        types = pokemon.types.join(',')
        evolutions = pokemon.evolutions_id.join(',')
        row = [pokemon.pokedex_id, pokemon.name, pokemon.url_regular, pokemon.url_shiny, types]
        row << evolutions unless evolutions.empty?
        csv << row
      end
    end
  end
end
