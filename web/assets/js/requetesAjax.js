/* 
 Script     : JavaScript pour envoyer une req ajax permettant de remplir des balsie select dans la vue gestionnaireInfos.jsp
 Created on : 2017-10-29, 18:58:03
 Author     : Dris & Francis
 */

var xho;
function select(critere, data)
{
    url = "selctionnerCinema.do?action=selectCinema&critere=" + critere + "&data=" + data;
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
            //alert(reponse);
            if (reponse.charAt(0) === 'a') {
                var reponse = reponse.substring(reponse.indexOf('a') + 1);
                document.getElementById("cinemaAjax").innerHTML = reponse;
            }
            if (reponse.charAt(0) === 'b') {
                var reponse = reponse.substring(reponse.indexOf('b') + 1);
                document.getElementById("numsalle").innerHTML = reponse;
            }
        } else
        {
            alert("Problème : " + xho.statusText);
        }
}
;

window.onload = function () {
    var id = document.getElementById("identifiant").value;
    select(id, "idGestionnaire");
};

var nomCinema = document.getElementById("cinemaAjax");
nomCinema.onchange = function () {
    select(nomCinema.value, "nomCinema");
};


