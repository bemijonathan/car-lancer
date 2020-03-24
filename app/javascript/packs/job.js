let input = document.querySelector(".name")
let iframe = document.querySelector('iframe')

const getLocation = () => {
  console.log('click')
  if (window.navigator.geolocation) {
    window.navigator.geolocation.getCurrentPosition((position) => {
      console.log(position.coords.latitude, position.coords.longitude)
      iframe.src= iframe.src.replace("q=",`q=${position.coords.latitude},${position.coords.longitude}`)
      input.value = `${position.coords.latitude},${position.coords.longitude}`
    });
    console.log(`${position.coords.latitude},${position.coords.longitude}`)
  } else {
    alert("Geolocation is not supported by this browser.")
  }
}

getLocation()