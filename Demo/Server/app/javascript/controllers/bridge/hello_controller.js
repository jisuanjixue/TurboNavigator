import { BridgeComponent } from "@hotwired/strada"

export default class extends BridgeComponent {
  static component = "hello"

  connect() {
    super.connect()

    this.send("connect", {}, () => {
    })
  }
}