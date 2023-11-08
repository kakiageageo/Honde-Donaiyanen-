  window.onload = function(){
    function addGenreField(){
      let html = `<input type="text" name="genre_name[]">`
      document.getElementById("aaa").insertAdjacentHTML('beforeEnd', html);
    }
    document.getElementById("add_genre").addEventListener('click', addGenreField)
    console.log("OK")
  }