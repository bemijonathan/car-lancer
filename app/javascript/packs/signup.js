let form = document.querySelector('.signup form')
let option = document.querySelector('select')
let tel = document.querySelector('.signup [name="phone"]')
let company = document.querySelector('.signup [name="bussinessname"]')

// Option.

option.addEventListener('change', (e) => {
    console.log(e.target.value)
    if(e.target.value === "mechanic"){
        form.action = form.action.replace('/user', '/mechanic')
        tel.classList.remove('hidden')
        company.classList.remove('hidden')
    }else{
        tel.classList.add('hidden')
        company.classList.add('hidden')
        form.action = form.action.replace('/mechanic', '/user')
    }
    console.log(form.action)
})