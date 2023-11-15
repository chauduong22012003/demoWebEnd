const radioOptions = document.querySelectorAll('.radio-option input[type="radio"]');
  

  function handleRadioChange(event) {
    const selectedValue = event.target.value;
    const radioOptions = document.querySelectorAll('.radio-option');
    radioOptions.forEach(option => {
      if (option.querySelector('input[type="radio"]').value === selectedValue) {
        option.classList.add('active');
      } else {
        option.classList.remove('active');
      }
    });
  }
  function handleRadioChangeNoneEvent(value) {
    const selectedValue =value;
    const radioOptions = document.querySelectorAll('.radio-option');
    radioOptions.forEach(option => {
      if (option.querySelector('input[type="radio"]').value === selectedValue) {
        option.classList.add('active');
      } else {
        option.classList.remove('active');
      }
    });
  }

  function handleClick(event) {
    var clickedDiv = event.target;
    var radioButton = clickedDiv.querySelector('.radio')
    radioOptions.forEach(function(i){
      
      if(i.value==radioButton.value){
        i.checked=true
        handleRadioChangeNoneEvent(i.value)
      }
      if (radioButton.value==4){
        var taskManager = clickedDiv.querySelector('.task_manager');
        if (taskManager.classList.contains('hide')) {
          taskManager.classList.remove('hide');
        } else {
          taskManager.classList.add('hide');
        }
      }
    })
  }

