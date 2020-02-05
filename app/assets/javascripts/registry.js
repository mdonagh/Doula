
// startSearch = () => {
//   fetch(`/search`)
//     // .then(response => response.json())
//     // .then(regig => {
//     //   console.log('====================================');
//     //   console.log(regig);
//     //   console.log('====================================');
//     .then(res => res.json())          // convert to plain text
//     .then(text => console.log(text))
// }
//===================================================================
document.addEventListener('DOMContentLoaded', function (e) {
  handleOnSearchsubmit()
})

let submitForm = ''

handleOnSearchsubmit = () => {
  let timer = null
  submitForm = document.getElementById('search_box')
  submitForm.addEventListener('keydown', function () {
    clearTimeout(timer);
    timer = setTimeout(startSearch, 1000)
  })
}

startSearch = () => {
  alert(`hey`);

}