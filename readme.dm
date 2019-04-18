# JIEL - Javascript Image Editor Library ![wip-badge]

<img src="/x_4github/js-lib.png" align="right"
     title="js lib" width="163" height="178">

JS library which accepts a image and provides basic manipulation like rotation, resizing and gray scaling.

[wip-badge]: https://img.shields.io/badge/WIP-work%20in%20progress-yellow.svg

### Features

1. round image
2. grey scale
3. return image info: width, height etc.
4. rotate

### Requirements

- [Lint/Prettier] - Prevent stylistic errors
- [JSDoc] - Document the code
- [Git] - Create repository on github and push/upload it
- [DRY] - Don't repeat yourself and provide clean code

### Project planing

All functions of this library are bundeln in a object called jiel.
User provides an image as parameter when calling the object with it functions.
Syntax: jiel.feature(parameter)

Functions:
-grey scale
-rotateRight, rotateLeft, rotate180
-mirror (horizontal)
-round (rounded image)
-info (width, height etc.)
-help (prints out all features)

Error handling, before running functions, check provided image:
-typeof, size > 0kb,

### Work diary

###### What are JS library?

External JavaScript file that contains code and provide functionality, therefore including
a library is the same as inclund a JS file. NOTE: Library should be added before own script tag.

###### How to call a function from an object?

```javascript
var obj = {
  a: function() {
    console.log("a is called");
  },
  b: function() {
    console.log("b is called");
  }
};

obj.a(); //a is called
```

###### How to safe images?

One way: encode with Base64 and store in a variable.

###### About Base64

Encoding sheme that represent binary data in ASCII string.

###### Base64 & JS

Only for strings:
atob() function decodes a string of data which has been encoded using base-64 encoding.
btoa() function creates a base-64 encoded ASCII string from a "string" of binary data.

```javascript
  /*<input id="inputFileToLoad" type="file" onchange="encodeImageFileAsURL();" />
  <div id="imgTest"></div>
  <script type='text/javascript'>*/
    function encodeImageFileAsURL() {

      var filesSelected = document.getElementById("inputFileToLoad").files;
      if (filesSelected.length > 0) { //unnecessary if
        var fileToLoad = filesSelected[0];

        var fileReader = new FileReader();

        fileReader.onload = function(fileLoadedEvent) { //you can console.log(fileLoadedEvent)
          var srcData = fileLoadedEvent.target.result; // <--- data: base64
          console.log(srcData)

          var newImage = document.createElement('img');
          newImage.src = srcData;

          document.getElementById("imgTest").innerHTML = newImage.outerHTML;
          console.log("Converted Base64 version is " + document.getElementById("imgTest").innerHTML);
        }        fileReader.readAsDataURL(fileToLoad);     }    }
```

###### Wrong derection

The images shouldn't be manipulated on pixel level, the manipulation is done through CSS which is injected to HTML through JS.

###### First version

```javascript
var element;

function selector(id) {
  // <----------------------------------to safe few lines of code
  var element = document.querySelectorAll(id);
  return element;
}

var obj = {
  // <-----------------------------------------------main obj with all functions
  setWidth: function(id, newWidth) {
    //element = selector(id)

    for (var i = 0; i < selector(id).length; i++) {
      //<-------very intersting "selector(id).length"
      selector(id)[i].style.width = newWidth;
    }
  },

  rotate: function(id, deg) {
    var element = document.querySelectorAll(id); //<------------how it looked before, without selctor(id)

    for (var i = 0; i < element.length; i++) {
      element[i].style.transform = "rotate(" + deg + "deg)";
    }
  },

  reset: function(id) {
    var element = document.querySelectorAll(id);

    for (var i = 0; i < element.length; i++) {
      element[i].removeAttribute("style");
    }
  }
};

obj.setWidth("#img2", "300px");
obj.setWidth("#img1", "300px");
// obj.setWidth('.pics', '300px')
obj.rotate("#img1", "40");
// obj.rotate('.pics','90')
// obj.reset('.pics')
```

###### What I learned

- Base64, encoding, decoding picture (only 80% sure how it works)
- Proper use of querySelectorAll, that they create array

```js
function selector(id) {
  var element = document.querySelectorAll(id);
  return element;
}
for (var i = 0; i < element.length; i++) {
  element[i].style.transform = "rotate(" + deg + "deg)";
}
//will not work, element in for out of scope
//initialise var element outside
//do as follow:
for (var i = 0; i < selector(id).length; i++) {
  selector(id)[i].style.width = newWidth;
}
```
```js 
//This snippet allowed to do above
function x () {      var a = 1;      return a    }
function y () {      var b = x();    console.log("b is: " +b)    }
y() //b is: 1
```

- Training: Parameter/Return, loop through array
