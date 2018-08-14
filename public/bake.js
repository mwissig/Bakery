console.log("js working")

function hoverdropCookie() {
  var element = document.getElementById("cookie");
  element.classList.remove("hide");
  element.classList.add("drop");
  setTimeout(function() {
    element.classList.remove("drop");
    element.classList.add("hide");
    console.log("removed")
  }, 3000);
}

function hoverdropCake() {
  var element = document.getElementById("cake");
  element.classList.remove("hide");
  element.classList.add("drop");
  setTimeout(function() {
    element.classList.remove("drop");
    element.classList.add("hide");
    console.log("removed")
  }, 3000);
}

function hoverdropMuffin() {
  var element = document.getElementById("muffin");
  element.classList.remove("hide");
  element.classList.add("drop");
  setTimeout(function() {
    element.classList.remove("drop");
    element.classList.add("hide");
    console.log("removed")
  }, 3000);
}
