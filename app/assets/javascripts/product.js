function step_change_currency(t){
    var currency = t[t.selectedIndex].id
    var rate=  t[t.selectedIndex].value;
    var url ='/convert_currency?currency='+currency+'&rate='+rate
    var xhr = new XMLHttpRequest();
    xhr.open("GET", url, true);
    xhr.onreadystatechange = function() {
      if (this.readyState == 4 && this.status == 200) {
        var response = JSON.parse(this.response)["prices"];
        for (var i = 0; i < response.length; i++) 
        {
           document.getElementById(i).innerHTML = response[i];
        }
      }
    };
    xhr.send();
}
