import { BridgeComponent } from "@hotwired/strada"

export default class extends BridgeComponent {
  static component = "post"

  connect() {
    super.connect()

    this.send("connect", {}, () => {
    })
  }
}