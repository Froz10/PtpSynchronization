var alert_del = document.querySelectorAll('.alert-del');

alert_del.forEach((x)=> {
    x.addEventListener('click', ()=> 
      x.parentElement.classList.add('hidden')
    );
});