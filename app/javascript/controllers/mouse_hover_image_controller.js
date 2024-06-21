// hover_image_controller.js
import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["regular", "shiny"];

  connect() {
    this.shinyTarget.style.display = 'none';
  }

  showShiny() {
    this.regularTarget.style.display = 'none';
    this.shinyTarget.style.display = 'block';
  }

  showRegular() {
    this.regularTarget.style.display = 'block';
    this.shinyTarget.style.display = 'none';
  }
}
