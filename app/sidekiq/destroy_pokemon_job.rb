# Defines a Sidekiq job to delete all Pokémon records from the database.
class DestroyPokemonJob
  include Sidekiq::Job

  def perform
    Pokemon.destroy_all
  end
end
