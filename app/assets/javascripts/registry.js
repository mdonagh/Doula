document.addEventListener('DOMContentLoaded', function () {
  handleOnSearchsubmit()
  console.log('loaded');
}, false);

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
  alert('submitForm.value in js', submitForm.value)
  document.getElementById('registry-search').submit(inputValue)
}
