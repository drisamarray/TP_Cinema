/* 
 Script     : JavaScript pour envoyer une req ajax permettant de remplir des balsie select dans la vue films.jsp
 Created on : 2017-10-29, 18:58:03
 Author     : Dris & Francis
            !!!!!!!!!!!!!! traitement inachevé !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
 */

var xho;
function select()
{
    url = "baliseCinema.do?action=remplirBalise";
    if (window.ActiveXObject) //si Internet Explorer
    {
        xho = new ActiveXObject("Microsoft.XMLHTTP");
        if (xho)
        {
            xho.onreadystatechange = processStateChange;
            xho.open("GET", url, true);
            xho.send();
        }
    } else //si autre navigateur
    {
        xho = new XMLHttpRequest();
        xho.onreadystatechange = processStateChange;
        try
        {
            xho.open("GET", url, true);
        } catch (e)
        {
            alert(e);
        }
        xho.send(null);
    }
}
;

function processStateChange()
{
    if (xho.readyState === 4) //complété
        if (xho.status === 200)  //réponse OK
        {
            var reponse = xho.responseText;
            alert(reponse);
            document.getElementById("cinemaAjax").innerHTML = reponse;
        } else
        {
            alert("Problème : " + xho.statusText);
        }
};

window.onload = function () {
    select();
};



