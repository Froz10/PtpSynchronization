import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ['elementToHide'];

  toggle() {
    this.elementToHideTarget.classList.toggle("hidden")
  }
}
