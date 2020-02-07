document.addEventListener('DOMContentLoaded', function () {
  handleOnSearchsubmit()
  console.log('loaded');
}, false);

let submitForm

handleOnSearchsubmit = () => {
  let timer = null
  submitForm = document.getElementById('search_box')
  if (submitForm) {
    submitForm.addEventListener('keydown', function () {
      clearTimeout(timer);
      timer = setTimeout(submitInput, 1000)
    })
  }
}

submitInput = () => {
  let inputValue = submitForm.value
  alert('submitting the form')
  document.getElementById('registry-search').submit(inputValue)
}
