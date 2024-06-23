import { Controller } from "@hotwired/stimulus"

// This controller is used to redirect to the root path and submit the form
export default class extends Controller {
  static targets = ['submit']
  redirectToRootAndSubmit() {
    // Set the item in sessionStorage => will submit on connect
    sessionStorage.setItem('autoSubmit', 'true');
    window.location.href = '/';
  }

  connect() {
    if (sessionStorage.getItem('autoSubmit') === 'true') {
      // Remove the item from sessionStorage => not submitting again
      sessionStorage.removeItem('autoSubmit');
      const submitButton = this.submitTarget;
      if (submitButton) {
        submitButton.click();
      }
    }
  }
}
