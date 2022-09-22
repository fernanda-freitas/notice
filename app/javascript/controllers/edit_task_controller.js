import { Controller } from "stimulus"

export default class extends Controller {
  static targets = [ "form", "list" ]

  displayForm() {
    this.formTarget.classList.remove("d-none")
  }
}
