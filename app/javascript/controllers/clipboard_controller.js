import { Controller } from "stimulus"

export default class extends Controller {
  static targets = [ "input", "copy", "check", "button" ]

  copy() {
    const urlToShare = this.inputTarget.value;
    navigator.clipboard.writeText(urlToShare);
    this.copyTarget.src = document.querySelector("#check").innerHTML;
    this.buttonTarget.setAttribute("data-tooltip", "Copied")
  }
}
