import { Controller } from "@hotwired/stimulus"

const audio = new Audio("/pokemonCatch.wav");

export default class extends Controller {
  static targets = ["checkbox", 'checked']

  connect() {
    console.log("hello");

    this.checkboxTargets.forEach((checkbox, index) => {
      const uniqueId = `checkbox-${index}`;
      checkbox.id = uniqueId;

      const isChecked = localStorage.getItem(uniqueId) === 'true';
      checkbox.checked = isChecked;

      checkbox.addEventListener('change', () => {
          localStorage.setItem(uniqueId, checkbox.checked.toString());
      });
    });
  }

  uncheck(event){
    console.log(this.checkboxTargets);
    event.preventDefault();
    this.element.submit();
    this.checkboxTargets.forEach(checkbox => {
      checkbox.checked = false;
      localStorage.setItem(checkbox.id, false);
    });
    audio.play();
  }
}
