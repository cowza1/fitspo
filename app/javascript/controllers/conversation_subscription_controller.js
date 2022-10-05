import { Controller } from "@hotwired/stimulus"
import { createConsumer } from "@rails/actioncable"

export default class extends Controller {
  static values = { conversationId: Number, currentAccountId: Number }
  static targets = ["messages"]

  connect() {
    this.channel = createConsumer().subscriptions.create(
      { channel: "ConversationChannel", id: this.conversationIdValue },
      { received: data => this.#insertMessageAndScrollDown(data) }

    )
    console.log(`Subscribed to the conversation with the id ${this.conversationIdValue}.`)
  }

  #justifyClass(currentAccountIsSender) {
    return currentAccountIsSender ? "justify-content-end" : "justify-content-start"
  }

  #accountStyleClass(currentAccountIsSender) {
    return currentAccountIsSender ? "sender-style" : "receiver-style"
  }

  #buildMessageElement(currentAccountIsSender, message) {
    return `
      <div class="message-row d-flex ${this.#justifyClass(currentAccountIsSender)}">
        <div class="${this.#accountStyleClass(currentAccountIsSender)}">
          ${message}
        </div>
      </div>
    `
  }

  #insertMessageAndScrollDown(data) {
    const currentAccountIsSender = this.currentAccountIdValue === data.sender_id
    const messageElement = this.#buildMessageElement(currentAccountIsSender, data.message)
    this.messagesTarget.insertAdjacentHTML("beforeend", messageElement)
    this.messagesTarget.scrollTo(0, this.messagesTarget.scrollHeight)
  }


  resetForm(event) {
    const form = event.target
    form.reset()
  }

  disconnect() {
    this.channel.disconnect()
  }

}
