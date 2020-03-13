let current_path = window.location.pathname

let anchors  = document.querySelectorAll('nav a')

console.log(anchors)

anchors.forEach(e => {
  if(e.pathname === current_path){
    e.classList.add('active')
  }
})
