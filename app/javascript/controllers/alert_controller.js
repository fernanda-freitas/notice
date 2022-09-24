import { Controller } from "stimulus"

export default class extends Controller {
  static targets = [ "alert" ]
  static values = { message: String, type: String }



  // connect() {
  //   console.log("Hello")
  //   console.log(this.alertTarget)
  // }

  alert(message, type) {
    const wrapper = document.createElement('div')
    wrapper.innerHTML = [
      `<div class="alert alert-${type} alert-dismissible" role="alert">`,
      `   <div>${message}</div>`,
      '   <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>',
      '</div>'
    ].join('')

    this.alertTarget.append(wrapper)
  }

  display() {
    this.alert(this.messageValue, this.typeValue)
  }

}
