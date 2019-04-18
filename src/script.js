
//version one
var obj1 = function (configObj) {

  var elements = document.querySelectorAll(configObj.selector)
  
    for ( var i = 0; i < elements.length; i++) {
      switch (configObj.action) {
  
        case 'rotate':
        elements[i].style.transform = "rotate("+configObj.value+"deg)" 
        console.log('Rotate was applied')
        break;
  
        case 'setWidth':
        elements[i].style.width = configObj.value+"px"
        console.log('Rotate was setWidth')
        break;
  
        case 'reset':
        elements[i].removeAttribute('style') 
        console.log('Rotate was reset')
        break;
  
        default:
          console.log('Error Switch Case, no "action" func')
      }
    }
  }
  
  // obj1({
  //   selector: '#img1',
  //   // selector: '.pics',
  //   action: 'rotate', 
  //   // action: 'setWidth',
  //   // action: 'reset',
  //   value: 100,
  // })

//version2
function selector (id) {
  var elements = document.querySelectorAll(id)
  return elements
}

var obj2 = {
  setWidth: function( id, newWidth) {   

    for ( var i = 0; i < selector(id).length; i++) {
      selector(id)[i].style.width = newWidth //select with function selector
    }
  },
  
  rotate: function(id,deg) {
    var element = document.querySelectorAll(id) //select direct way

    for ( var i = 0; i < element.length; i++) {
      element[i].style.transform = "rotate("+deg+"deg)" 
    }
  },

  reset: function(id) { 
    var element = document.querySelectorAll(id)

    for ( var i = 0; i < element.length; i++) {
      element[i].removeAttribute('style') 
    }
  },
};

// obj2.setWidth('#img2', '300px')
// obj2.setWidth('#img1', '300px')
// obj2.setWidth('.logos', '300px')
// obj2.rotate('.logos', 180)
// obj2.reset('.logos')
