import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="catch"
export default class extends Controller {
  static targets=["put"]
  connect() {
    console.log("hello");
  }

  pokemon() {
    fetch("https://pokeapi.co/api/v2/generation/1")
      .then(response => response.json())
      .then(data => {
        data.pokemon_species.forEach(element => {
          fetch(element.url)
            .then(response => response.json())
            .then(speciesData => {
              fetch(speciesData.evolution_chain.url)
                .then(response => response.json())
                .then(evolutionData => {
                  const chain = evolutionData.chain;
                  // Print the first evolution (direct evolution)
                  if (chain.evolves_to.length > 0) {
                    chain.evolves_to.forEach(firstEvolution => {
                      console.log("First Evolution Name:", firstEvolution.species.name);
                      // Print the second evolution (evolution of the first evolution)
                      if (firstEvolution.evolves_to.length > 0) {
                        firstEvolution.evolves_to.forEach(secondEvolution => {
                          console.log("Second Evolution Name:", secondEvolution.species.name);
                        });
                      }
                    });
                  }
                });
            });
        });
      });
  }
}
