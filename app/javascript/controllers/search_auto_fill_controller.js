import { Controller } from '@hotwired/stimulus'

export default class extends Controller {

  connect() {
    console.log("Hello from SearchAutoFill controller");
  }

  display() {
    questions.set_data = search_is_offering.value
  }
}
