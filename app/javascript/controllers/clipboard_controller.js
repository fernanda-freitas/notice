import { Controller } from "stimulus"

export default class extends Controller {
  static targets = [ "input", "copy", "check", "button" ]


  copy() {
    const urlToShare = this.inputTarget.value;
    navigator.clipboard.writeText(urlToShare);
    const attachedRegex = /\w/;
    this.copyTarget.src = `/assets/icon-check.svg${attachedRegex}`;
    this.buttonTarget.setAttribute("data-tooltip", "Copied")
  }
}
