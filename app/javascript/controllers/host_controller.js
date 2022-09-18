import { Controller } from "@hotwired/stimulus"
import { enter, leave, toggle } from 'el-transition'

export default class extends Controller {
  static targets = ['renderModal'];

  connect() {
    this.renderModalTargets.forEach((link) => {    
      link.addEventListener('click', () => {
        console.log("click")
      });
    });
  }
}
