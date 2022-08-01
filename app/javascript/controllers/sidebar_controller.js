import { Controller } from "@hotwired/stimulus"
import { enter, leave, toggle } from 'el-transition'

export default class extends Controller {
  static targets = ['openSidebarMenu'];

  toggleDropdownMenuOne() {
    toggle(document.getElementById('sidebar-dropdown-item-1'));
  }

  toggleDropdownMenuTwo() {
    toggle(document.getElementById('sidebar-dropdown-item-2'));
  }

  toggleDropdownMenuThree() {
    toggle(document.getElementById('sidebar-dropdown-item-3'));
  }
}
