function fechaActual(){

var f = new Date();
//var oldscrollHeight = jQuery(".div_table").attr("scrollHeight") - 20; //La altura del scroll 

var mes =  (f.getMonth() +1);
var dia = f.getDate();

if (mes < 10) {

	mes = '0' + mes;
}

if (dia < 10) {

	dia = '0' + dia;
}

 return (dia + "/" + mes + "/"  + f.getFullYear());

}


function getGET(){

	var loc = document.location.href;
	var getString = loc.split('?')[1];

	if (typeof(getString)== "undefined") { return false; }

	var GET = getString.split('&');
	var get = {};//this object will be filled with the key-value pairs and returned.

	for(var i = 0, l = GET.length; i < l; i++){
		var tmp = GET[i].split('=');
		get[tmp[0]] = unescape(decodeURI(tmp[1]));
	}
	return get;
}