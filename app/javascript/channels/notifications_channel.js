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
    let notice = document.createElement('div')
    notice.innerHTML = `<div class="alert alert-warning alert-dismissible mt-10 fade show" role="alert">
    <p> New Post by ${data.posted_by} </p>
    <p> Title: ${data.title} </p>
    <button type="button" class="close" data-dismiss="alert" aria-label="Close">
      <span aria-hidden="true">&times;</span>
    </button>
  </div>`
    document.body.appendChild(notice)
    // Called when there's incoming data on the websocket for this channel
  }
});
