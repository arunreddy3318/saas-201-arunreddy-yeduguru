// This is a closure function https://medium.com/javascript-scene/master-the-javascript-interview-what-is-a-closure-b2f0d2152b36
(function() {
  var initialize = function() {
    /*
      1. Add all your event bindings here. Please avoid binding events inline and add your event listeners here.
      onSubmit callback

      disableDuplicateSecondaryDepartment callback,...
    */
    document.querySelector(".button").addEventListener("click",onSubmit);
    document.querySelector("#department1").addEventListener("change",disableDuplicateSecondaryDepartment);
  };

  var disableDuplicateSecondaryDepartment=function() {
    // 2. in department2, Should disable the option selected in department1

    let object1 = document.getElementById("department1");
    let object2 = document.getElementById("department2");
    let index=object1.selectedIndex;
    for(var i=0;i<object2.length;i++)
    {
      if( index == i)
      {
        object2.options[index].disabled=true;
      }
      else
      {
       object2.options[i].disabled=false;
      }
    }
    return;
  }

  var constructData = function() {
    var data = {};

    // 3. Construct data from the form here. Please ensure that the keys are the names of input elements

    var name =document.getElementsByName("name");
    data["name"]=name[0].value;
    var phoneno =document.getElementsByName("phno");
    data["phno"]=phoneno[0].value;
    var mail =document.getElementsByName("emailaddress");
    data["emailaddress"]=mail[0].value;
    var department1 =document.getElementsByName("department1");
    if(department1.selectedIndex < 1)
    {
    data["department1"]=department1[0].options[0].value;
    }
    else
    {
      data["department1"]=department1[0].value;
    }
    var department2 =document.getElementsByName("department2");
    if(department2.selectedIndex < 1)
    {
    data["department2"]=department2[0].options[0].value;}
    else
    {
      data["department2"]=department2[0].value;
    }
    console.log(data);
    return data;
  }

  var validateResults = function(data) {
    var isValid = true;

    // 4. Check if the data passes all the validations here

    if(data["name"].length<=100)
    {
      if(data["phno"].length<=10)
      {
        var mail=data["emailaddress"];
        var regexpr=/^([a-zA-Z0-9\.]+)(@college.edu)$/;
        console.log(regexpr.test(mail));
        if (regexpr.test(mail)) 
        {
          if(data["department1"] != data["department2"])
            {
              isValid=true;
            }
          else
            {
              isValid=false;
            }
        } 
        else 
        {
          isValid=false;
        }
      }
      else
      {
        isValid=false;
      }
    }
    else
    {
      isValid=false;
    }
    return isValid;
  };

  var onSubmit = function(event) {
    // 5. Figure out how to avoid the redirection on form submit

    event.preventDefault();
    var data = constructData();
    if (validateResults(data)) {
      printResults(data);
    } else {
      var resultsDiv = document.getElementById("results");
      resultsDiv.innerHTML = '';
      resultsDiv.classList.add("hide");
    }
  };

  var printResults = function(data) {
    var constructElement = function([key, value]) {
      return `<p class='result-item'>${key}: ${value}</p>`;
    };

    var resultHtml = (Object.entries(data) || []).reduce(function(innerHtml, keyValuePair) {
      debugger
      return innerHtml + constructElement(keyValuePair);
    }, '');
    var resultsDiv = document.getElementById("results");
    resultsDiv.innerHTML = resultHtml;
    resultsDiv.classList.remove("hide");
  };

  /*
    Initialize the javascript functions only after the html DOM content has loaded.
    This is to ensure that the elements are present in the DOM before binding any event listeners to them.
  */
  document.addEventListener('DOMContentLoaded', initialize);
})();