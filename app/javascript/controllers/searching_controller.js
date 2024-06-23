import { Controller } from "@hotwired/stimulus"

// This controller is used to submit the search form when the user typing
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
