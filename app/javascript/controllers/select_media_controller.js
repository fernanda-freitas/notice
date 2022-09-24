import { Controller } from "stimulus"

export default class extends Controller {
  static targets = [ "form" ]

  displayForm() {
    this.formTarget.classList.remove("d-none")
  }
}
