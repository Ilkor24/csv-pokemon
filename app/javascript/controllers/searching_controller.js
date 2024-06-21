import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="searching"
export default class extends Controller {
  static targets = ["form", "input"]

  connect() {
    this.inputTarget.focus()
    const valueLength = this.inputTarget.value.length;
    this.inputTarget.setSelectionRange(valueLength, valueLength);
  }

  submit() {
    clearTimeout(this.timeout)
    this.timeout = setTimeout(() => {
      this.formTarget.requestSubmit()
    })
    this.inputTarget.focus()
  }
}
