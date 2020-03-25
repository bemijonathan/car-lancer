import consumer from "./consumer"

consumer.subscriptions.create("NotificationsChannel", {
  connected() {
    console.log("connected")
    // Called when the subscription is ready for use on the server
  },

  disconnected() {
    // Called when the subscription has been terminated by the server
    console.log('connect')
  },

  received(data) {
    console.log(data, "i recieved this data")
    // Called when there's incoming data on the websocket for this channel
  }
});
