import { Controller } from '@hotwired/stimulus'

export default class extends Controller {
  static targets = ["info"]

  highlight(event) {
    this.infoTargets.forEach(chatroom => {
      chatroom.classList.remove("active");
    })
    event.currentTarget.classList.add("active")
  }
}
