import { Controller } from "@hotwired/stimulus"
import { enter, leave, toggle } from 'el-transition'

export default class extends Controller {
  static targets = ['closeButton', 'input'];

  connect() {
    this.closeButtonTarget.addEventListener('click', () => {
      leave(document.getElementById('modal-wrapper'));
      leave(document.getElementById('modal-backdrop'));
      leave(document.getElementById('modal-panel'));
    });
  }

  findHostname() {
    fetch(`/hosts/1?hostname=${ this.inputTarget.value }`)
      .then((response) => response.json())
      .then((data) => console.log(data));
  }
}
