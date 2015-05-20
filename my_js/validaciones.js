function numero(valor, decimal){

 decimal || ( decimal = '' );
	alert(decimal);

}





function soloLetra(tecla){



	if((tecla.charCode < 97 || tecla.charCode > 122) && (tecla.charCode < 65 || tecla.charCode > 90) && (tecla.charCode != 45)) return false;


}