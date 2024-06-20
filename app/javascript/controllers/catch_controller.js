import { Controller } from "@hotwired/stimulus"

const audio = new Audio("../../assets/audio/pokemonCatch.wav");
// Connects to data-controller="catch"
export default class extends Controller {
  static targets = ["checkbox"]
  connect() {
    console.log("hello");
    this.pokemon()
  }

  uncheck(){
    this.checkboxTargets.forEach(checkbox => {
      checkbox.checked = false;
      audio.play();
    });
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
                  if (chain.evolves_to.length > 0) {
                    chain.evolves_to.forEach(firstEvolution => {
                      fetch(firstEvolution.species.url)
                      .then(reponse => reponse.json())
                      .then(data =>
                        console.log(data.id)
                      )
                      if (firstEvolution.evolves_to.length > 0) {
                        firstEvolution.evolves_to.forEach(secondEvolution => {
                          fetch(secondEvolution.species.url)
                          .then(reponse => reponse.json())
                          .then(data =>
                            console.log(data.id)
                          )
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
