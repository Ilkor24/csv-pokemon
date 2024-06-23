class DestroyPokemonJob
  include Sidekiq::Job

  def perform
    Pokemon.destroy_all
  end
end
