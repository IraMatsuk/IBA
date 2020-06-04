function Selected1(a) {
   var label = a.value;
   if (label=="No") {
      document.getElementById("Block1").setAttribute('disabled', 'disabled');
   } 
   else
   document.getElementById("Block1").removeAttribute('disabled');
} 

function Selected2(a) {
    var label = a.value;
    if (label=="No") {
        document.getElementById("Block2").setAttribute('disabled', 'disabled');
    } 
    else
    document.getElementById("Block2").removeAttribute('disabled');
} 



