// hover_image_controller.js
import { Controller } from "@hotwired/stimulus"

// This controller is used to show the shiny image when the user hovers over the regular image
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
