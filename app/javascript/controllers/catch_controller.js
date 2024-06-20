import { Controller } from "@hotwired/stimulus"

const audio = new Audio("/pokemonCatch.wav");

export default class extends Controller {
  static targets = ["checkbox", 'checked']
  static values = { audioPath: String }
  connect() {
    console.log("hello");
  }

  uncheck(event){
    event.preventDefault();
    this.element.submit();
    this.checkboxTargets.forEach(checkbox => {
      checkbox.checked = false;
    });
    audio.play();
  }

  check(){
  }
}

// pokemon() {
//   fetch("https://tyradex.vercel.app/api/v1/pokemon")
//   .then(response => response.json())
//   .then(data => {
//     data.forEach(pokemon => {
//       if (pokemon.generation === 1) {
//         console.log(pokemon.pokedex_id);
//         const french_name = pokemon.name.fr;
//         const url_regular = pokemon.sprites.regular;
//         const url_shiny = pokemon.sprites.shiny
//         const tipes = [];
//         if (pokemon.types !== null)  {
//         pokemon.types.forEach(type => {
//           tipes.push(type.name);
//         });
//       }
//         const evolve_next = [];
//         const evolve_previous = [];
//         if (pokemon.evolution !== null && pokemon.evolution.next !== null) {
//           pokemon.evolution.next.forEach(evolution => {
//             evolve_next.push(evolution.pokedex_id);
//           });
//         }
//         if (pokemon.evolution !== null && pokemon.evolution.pre !== null) {
//           pokemon.evolution.pre.forEach(evolution => {
//             console.log(evolution.name);
//             evolve_previous.push(evolution.pokedex_id);
//           });
//         }
//       }
//     });
//   })
// }

// fetch("https://pokeapi.co/api/v2/generation/1")
// .then(response => response.json())
// .then(data => {
//   data.pokemon_species.forEach(element => {
//     fetch(element.url)
//       .then(response => response.json())
//       .then(speciesData => {
//         fetch(speciesData.evolution_chain.url)
//           .then(response => response.json())
//           .then(evolutionData => {
//             const chain = evolutionData.chain;
//             if (chain.evolves_to.length > 0) {
//               chain.evolves_to.forEach(firstEvolution => {
//                 fetch(firstEvolution.species.url)
//                 .then(reponse => reponse.json())
//                 .then(data =>
//                   console.log(data.id)
//                 )
//                 if (firstEvolution.evolves_to.length > 0) {
//                   firstEvolution.evolves_to.forEach(secondEvolution => {
//                     fetch(secondEvolution.species.url)
//                     .then(reponse => reponse.json())
//                     .then(data =>
//                       console.log(data.id)
//                     )
//                   });
//                 }
//               });
//             }
//           });
//       });
//   });
// });
