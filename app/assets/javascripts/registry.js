document.addEventListener('DOMContentLoaded', function (e) {
  handleOnSearchsubmit()
})

let submitForm

handleOnSearchsubmit = () => {
  let timer = null
  submitForm = document.getElementById('search_box')
  submitForm.addEventListener('keydown', function () {
    clearTimeout(timer);
    timer = setTimeout(submitInput, 1000)
  })
}

submitInput = () => {
  let inputValue = submitForm.value
  console.log('submitForm.value in js', submitForm.value)
  document.getElementById('registry-search').submit(inputValue)
}