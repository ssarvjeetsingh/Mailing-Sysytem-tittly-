
function fun()
{
    
    var a=document.getElementById("pass").value;
    
    if(a.length<8)
    {
        alert("pass must be of min 8 character");
        window.location("log.html");
    }
}

