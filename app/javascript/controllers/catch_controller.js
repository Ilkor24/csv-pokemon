import { Controller } from "@hotwired/stimulus"

const audio = new Audio("/pokemonCatch.wav");

export default class extends Controller {
  static targets = ["checkbox", 'checked']

  connect() {
    console.log("hello");
  }

  uncheck(event){
    console.log(this.checkboxTargets);
    event.preventDefault();
    this.element.submit();
    this.checkboxTargets.forEach(checkbox => {
      checkbox.checked = false;
    });
    audio.play();
  }
}
