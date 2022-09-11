import { Controller } from "stimulus"

export default class extends Controller {
  static targets = [ "input" ]

  copy(event) {
    const urlToShare = this.inputTarget.value;
    navigator.clipboard.writeText(urlToShare);
    event.currentTarget.disabled = true;
    event.currentTarget.innerText = "Copied!";
  }
}
