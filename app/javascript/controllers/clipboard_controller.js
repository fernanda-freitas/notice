import { Controller } from "stimulus"

export default class extends Controller {
  static targets = [ "input" ]
  static values = {
    feedbackText: String
  }

  copy(event) {
    const url = this.inputTarget.value
    navigator.clipboard.writeText(url);
    event.currentTarget.disabled = true;
    event.currentTarget.innerText = this.feedbackTextValue;
  }
}
