import { Controller } from "@hotwired/stimulus"
import { enter, leave, toggle } from 'el-transition'

var arraySize = 0

export default class extends Controller {
  initialize() {
    this.element.addEventListener("hidden", this.hidePanel())
  }

  static targets = ['closeButton', 'input', 'output', 'hostnameChoice', 'source'];

  connect() {
    this.closeButtonTarget.addEventListener('click', () => {
      leave(document.getElementById('modal-wrapper'));
      leave(document.getElementById('modal-backdrop'));
      leave(document.getElementById('modal-panel'));
    });
  }
  
  findHostname() {
    this.sourceTarget.classList.remove("hidden")
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
        arraySize = hostsArray.length
        this.hidePanel(arraySize)
    })   
  }

  hostTemplate(host) {
      return `
      <li class="px-3 py-2 cursor-pointer hover:bg-gray-200" data-action="click->panel#hostnameChoice">
        <h3 data-panel-target='hostnameChoice(${host})'> ${host}</h3>
      </li>`
  }

  hostnameChoice(host) {
    this.inputTarget.value = `${host.originalTarget.textContent.trim()}`
    this.sourceTarget.classList.add("hidden")
  }

  hidePanel() {
    if ( arraySize === 0 ) {
      this.sourceTarget.classList.add("hidden")
    }
  }
}