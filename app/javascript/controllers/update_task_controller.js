import { Controller } from "stimulus"

export default class extends Controller {
  static targets = [ "form", "list" ]

  update(e) {
    e.preventDefault()
    console.log("update click works")
  }
}
