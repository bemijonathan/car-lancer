

import consumer from "./consumer"

if(window.location.pathname.includes("messages")){

  

let id = window.location.pathname.replace("/messages/", "")

console.log(id)

consumer.subscriptions.create({ channel: "ChatChannel", id }, {
  connected() {
    console.log("channel connected")
    scrollEnd()
  },

  disconnected() {
    console.log("channel disconnected")
    scrollEnd()
  },

  received(data) {
    console.log("recieved", data)
    addMessage(data)
    scrollEnd()
  }
});


const addMessage = (data) => {
  let cardBody = document.querySelector('.card-body.msg_card_body')
  let name = document.querySelector('div.card-header.msg_head > div.d-flex.bd-highlight > div.user_info > span').innerText
  let message = document.createElement('div')
  console.log(name, data.from)
  // debugger
  // if (name !== data.from) {
    message.innerHTML = `
    <div class="d-flex justify-content-start mb-4">
      <div class="img_cont_msg">
        <img src="https://static.turbosquid.com/Preview/001292/481/WV/_D.jpg" class="rounded-circle user_img_msg">
      </div>
      <div class="msg_cotainer">
         ${data.body}
        <span class="msg_time">8:40 AM, Today</span>
      </div>
    </div>`
  cardBody.appendChild(message)
  let input = document.querySelector("[chat] form")
  input.reset()
}

const scrollEnd=()=>{
  var objDiv = document.querySelector('.card-body.msg_card_body')
  objDiv.scrollTop = objDiv.scrollHeight;
}

}