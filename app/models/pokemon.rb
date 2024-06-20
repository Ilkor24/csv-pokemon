class Pokemon < ApplicationRecord
  def self.to_csv
    attributes = %w(name pokedex_id url_regular url_shiny types evolutions_id)
    CSV.generate(headers: true) do |csv|
      csv << attributes
      all.each do |pokemon|
        csv << [pokemon.name, pokemon.pokedex_id, pokemon.url_regular, pokemon.url_shiny, pokemon.types.join(', '), pokemon.evolutions_id.join(', ')]
      end
    end
  end
end
