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