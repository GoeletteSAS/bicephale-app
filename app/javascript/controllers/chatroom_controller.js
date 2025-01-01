import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="chatroom"
export default class extends Controller {
  connect() {
    console.log("chatroom controller connected");
  }
  submit(event) {
    event.preventDefault()  // Empêche l'envoi traditionnel du formulaire
    const form = this.element

    fetch(form.action, {
      method: "POST",
      body: new FormData(form),
      headers: {
        "Accept": "text/vnd.turbo-stream.html"  // Pour turbo-stream responses
      }
    }).then(response => {
      if (response.ok) {
        form.reset()  // Réinitialise le formulaire après succès
        const modal = bootstrap.Modal.getInstance(document.getElementById('newChatroomModal'))
        modal.hide()  // Ferme le modal
      } else {
        // Gestion des erreurs ici si besoin
        alert("Erreur lors de l'envoi du message.")
      }
    })
  }
}
