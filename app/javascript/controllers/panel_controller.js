import { Controller } from "@hotwired/stimulus"
import { enter, leave, toggle } from 'el-transition'

export default class extends Controller {
  static targets = ['closeButton', 'input', 'output', 'hostnameChoice'];

  connect() {
    this.closeButtonTarget.addEventListener('click', () => {
      leave(document.getElementById('modal-wrapper'));
      leave(document.getElementById('modal-backdrop'));
      leave(document.getElementById('modal-panel'));
    });
  }

  findHostname() {
    fetch(`/hosts/search?hostname=${ this.inputTarget.value }`, {
      headers: { accept: 'application/json'} })
      .then((response) => response.json())
      .then((data) => {
        var hostsHTML = "";
        var hostsArray = Object.values(data)[0]
        hostsArray.forEach(host => {
          hostsHTML += this.hostTemplate(host)
        });
        this.outputTarget.innerHTML = hostsHTML;
    });
  }

  hostTemplate(host) {
    return `
      <li class="px-3 py-2 cursor-pointer hover:bg-gray-200" data-action="click->panel#hostnameChoice">
        <h4 data-panel-target='hostnameChoice(${host})'> ${host}</h4>
      </li>`
  }

  hostnameChoice(host) {
    this.inputTarget.value = `${host.originalTarget.textContent.trim()}`
  }
}
