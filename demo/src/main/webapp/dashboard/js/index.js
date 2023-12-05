/*const radioOptions = document.querySelectorAll('.radio-option input[type="radio"]');
  

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
	let tranplay_contents=document.querySelectorAll(".tranplay_content")
	
    var clickedDiv = event.target;
    var radioButton = clickedDiv.querySelector('.radio')
    radioOptions.forEach(function(i){
		
      
      if(!tranplay.classList.contains('hide')){
			tranplay.classList.add('hide')
		}
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

/*xu ly navigation*/
/*var navs=document.querySelectorAll('.mynav');
var nav1=document.querySelector('1');
var nav1=document.querySelector('2');
var nav1=document.querySelector('3');
var nav1=document.querySelector('5');
var nav1=document.querySelector('6');
var nav1=document.querySelector('7');

function addHide(i){
	radioOptions.forEach(opt=>{
		if(opt.value==i){
			let item=document.querySelector(`.${i}`);
		}
		else{
			
		}
			
		
	})
}*/



/**/


















var mynavs=document.querySelector('.mynav');



function handleClick(event){
	let listE=document.querySelectorAll('.tranplay_content')
	
	let i=event.target
	if(!(i.dataset.value==="managerProducts")){
		listE.forEach(i=>{
		if(i.classList.contains('hide')){
			
		}
		else{
			i.classList.add('hide')
		}
	})
	}
	
	if(i.dataset.value==="managerProducts"){
		let e=document.querySelector(".task_manager");
		if (e.classList.contains('hide')){
			e.classList.remove('hide')
		}
		else{
			e.classList.add('hide')
		}
	}
	else if(i.dataset.value==="Add"){
		let e=document.querySelector('.addForm')
		if(e.classList.contains('hide')){
			e.classList.remove('hide')
		}
	}
	else if(i.dataset.value==="Modify"){
		let e=document.querySelector('.modifyPage')
		if(e.classList.contains('hide')){
			e.classList.remove('hide')
		}
	}
	
}





























