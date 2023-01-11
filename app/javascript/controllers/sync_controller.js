import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static values = {
    id: Number
  }

  check_ptp_status() {
    fetch(`/api/synchronizations?host_id=${ this.idValue }`, {
      method: 'POST',
      headers: { accept: 'application/json'}
      })
    .then (response => response.text())
    .then(html => Turbo.renderStreamMessage(html));
  }
}
