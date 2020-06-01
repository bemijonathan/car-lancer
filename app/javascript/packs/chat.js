
let cardBody = document.querySelector('.card-body.msg_card_body')
let name = document.querySelector('div.card-header.msg_head > div.d-flex.bd-highlight > div.user_info > span').innerText

let input = document.querySelector("[chat] form")

input.addEventListener('submit', (e) => {
    let message = document.createElement('div')
    console.log(e.target.body.value)
    message.innerHTML = `
  <div class="d-flex justify-content-end mb-4">
    <div class="msg_cotainer_send">
      ${e.target.body.value}
      <span class="msg_time_send">8:55 AM, Today</span>
    </div>
    <div class="img_cont_msg">
      <img src="">
    </div>
  </div>
`; 
cardBody.appendChild(message)
scrollEnd()
// input.reset()

})




const scrollEnd=()=>{
    var objDiv = document.querySelector('.card-body.msg_card_body')
    objDiv.scrollTop = objDiv.scrollHeight;
}

scrollEnd()