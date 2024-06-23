import { Controller } from "@hotwired/stimulus"

const audio = new Audio("/pokemonCatch.wav");

export default class extends Controller {
  static targets = ["checkbox"]

  connect() {
    this.checkboxTargets.forEach((checkbox) => {
      // Identifier unique > id with index
      const uniqueId = `checkbox-${checkbox.dataset.pokemonName}`;
      checkbox.id = uniqueId;

      const isChecked = localStorage.getItem(uniqueId) === 'true';
      checkbox.checked = isChecked;

      checkbox.addEventListener('change', () => {
          localStorage.setItem(uniqueId, checkbox.checked.toString());
      });
    });
  }

  uncheck(event){
    event.preventDefault();
    this.element.submit();
    this.checkboxTargets.forEach(checkbox => {
      checkbox.checked = false;
      const uniqueId = `checkbox-${checkbox.dataset.pokemonName}`;
      localStorage.setItem(uniqueId, false);
    });
    audio.play();
  }

  allcheck(){
    this.checkboxTargets.forEach(checkbox => {
      checkbox.checked = true;
    });
  }
}
