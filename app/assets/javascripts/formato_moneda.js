
//  Monto Solicitado
document.getElementById("loanformulary_monto_solicitado").onchange =function (){

    if (document.getElementById("loanformulary_monto_solicitado").value != "" && isNaN(document.getElementById("loanformulary_monto_solicitado").value)) {
      var array_solicitado = document.getElementById("loanformulary_monto_solicitado").value.split(' ')[1].split('.');
      var tamano_solicitado = array_solicitado.length; var i = 0;
      var monto_solicitado = 0;
      while (tamano_solicitado > 0) {
        monto_solicitado += array_solicitado[i]*Math.pow(1000, tamano_solicitado-1);
        tamano_solicitado -= 1; i += 1;
      }
      document.getElementById("loanformulary_monto_solicitado").value = monto_solicitado;
    }

    this.value = parseFloat(this.value.replace(/,/g, ""))
                    .toFixed(0)
                    .toString()
                    .replace(/\B(?=(\d{3})+(?!\d))/g, ".");

    document.getElementById("loanformulary_monto_solicitado").value = "$ "+this.value.replace(/,/g, "");
}

//  Monto Aprobado
document.getElementById("loanformulary_monto_aprobado").onchange =function (){

    if (document.getElementById("loanformulary_monto_aprobado").value != "" && isNaN(document.getElementById("loanformulary_monto_aprobado").value)) {
      var array_aprobado = document.getElementById("loanformulary_monto_aprobado").value.split(' ')[1].split('.');
      var tamano_aprobado = array_aprobado.length; var i = 0;
      var monto_aprobado = 0;
      while (tamano_aprobado > 0) {
        monto_aprobado += array_aprobado[i]*Math.pow(1000, tamano_aprobado-1);
        tamano_aprobado -= 1; i += 1;
      }
      document.getElementById("loanformulary_monto_aprobado").value = monto_aprobado;
    }

    this.value = parseFloat(this.value.replace(/,/g, ""))
                    .toFixed(0)
                    .toString()
                    .replace(/\B(?=(\d{3})+(?!\d))/g, ".");

    document.getElementById("loanformulary_monto_aprobado").value = "$ "+this.value.replace(/,/g, "");

    if (document.getElementById("loanformulary_numero_cuotas").value != "") {
      var array_aprobado = document.getElementById("loanformulary_monto_aprobado").value.split(' ')[1].split('.');
      var tamano_aprobado = array_aprobado.length; var i = 0;
      var monto_aprobado = 0;
      while (tamano_aprobado > 0) {
        monto_aprobado += array_aprobado[i]*Math.pow(1000, tamano_aprobado-1);
        tamano_aprobado -= 1; i += 1;
      }

      var valor = monto_aprobado/(document.getElementById("loanformulary_numero_cuotas").value);
      document.getElementById("loanformulary_monto_cuota").value = parseFloat(valor.toString().replace(/,/g, ""))
                      .toFixed(0)
                      .toString()
                      .replace(/\B(?=(\d{3})+(?!\d))/g, ".");

      document.getElementById("loanformulary_monto_cuota").value = "$ "+document.getElementById("loanformulary_monto_cuota").value.replace(/,/g, "");
    }
}

//  Cantidad de Cuotas
document.getElementById("loanformulary_numero_cuotas").onblur = function (){

    if (document.getElementById("loanformulary_monto_aprobado").value != "") {

      var array_aprobado = document.getElementById("loanformulary_monto_aprobado").value.split(' ')[1].split('.');
      var tamano_aprobado = array_aprobado.length; var i = 0;
      var monto_aprobado = 0;
      while (tamano_aprobado > 0) {
        monto_aprobado += array_aprobado[i]*Math.pow(1000, tamano_aprobado-1);
        tamano_aprobado -= 1; i += 1;
      }

      var valor = monto_aprobado/this.value;
      document.getElementById("loanformulary_monto_cuota").value = parseFloat(valor.toString().replace(/,/g, ""))
                      .toFixed(0)
                      .toString()
                      .replace(/\B(?=(\d{3})+(?!\d))/g, ".");

      document.getElementById("loanformulary_monto_cuota").value = "$ "+document.getElementById("loanformulary_monto_cuota").value.replace(/,/g, "");
    }
}

//  Renta Líquida
document.getElementById("loanformulary_renta_liquida").onchange =function (){

    if (document.getElementById("loanformulary_renta_liquida").value != "" && isNaN(document.getElementById("loanformulary_renta_liquida").value)) {
      var array_renta_liquida = document.getElementById("loanformulary_renta_liquida").value.split(' ')[1].split('.');
      var tamano_renta_liquida = array_renta_liquida.length; var i = 0;
      var renta_liquida = 0;
      while (tamano_renta_liquida > 0) {
        renta_liquida += array_renta_liquida[i]*Math.pow(1000, tamano_renta_liquida-1);
        tamano_renta_liquida -= 1; i += 1;
      }
      document.getElementById("loanformulary_renta_liquida").value = renta_liquida;
    }

    this.value = parseFloat(this.value.replace(/,/g, ""))
                    .toFixed(0)
                    .toString()
                    .replace(/\B(?=(\d{3})+(?!\d))/g, ".");

    document.getElementById("loanformulary_renta_liquida").value = "$ "+this.value.replace(/,/g, "");
}

//  Fondo Finiquito
document.getElementById("loanformulary_fondo_finiquito").onchange =function (){

    if (document.getElementById("loanformulary_fondo_finiquito").value != "" && isNaN(document.getElementById("loanformulary_fondo_finiquito").value)) {
      var array_finiquito = document.getElementById("loanformulary_fondo_finiquito").value.split(' ')[1].split('.');
      var tamano_finiquito = array_finiquito.length; var i = 0;
      var monto_finiquito = 0;
      while (tamano_finiquito > 0) {
        monto_finiquito += array_finiquito[i]*Math.pow(1000, tamano_finiquito-1);
        tamano_finiquito -= 1; i += 1;
      }
      document.getElementById("loanformulary_fondo_finiquito").value = monto_finiquito;
    }

    this.value = parseFloat(this.value.replace(/,/g, ""))
                    .toFixed(0)
                    .toString()
                    .replace(/\B(?=(\d{3})+(?!\d))/g, ".");

    document.getElementById("loanformulary_fondo_finiquito").value = "$ "+this.value.replace(/,/g, "");
}

//  Descuentos En Curso
document.getElementById("loanformulary_descuentos_en_curso").onchange =function (){

    if (document.getElementById("loanformulary_descuentos_en_curso").value != "" && isNaN(document.getElementById("loanformulary_descuentos_en_curso").value)) {
      var array_descuentos_en_curso = document.getElementById("loanformulary_descuentos_en_curso").value.split(' ')[1].split('.');
      var tamano_descuentos_en_curso = array_descuentos_en_curso.length; var i = 0;
      var descuentos_en_curso = 0;
      while (tamano_descuentos_en_curso > 0) {
        descuentos_en_curso += array_descuentos_en_curso[i]*Math.pow(1000, tamano_descuentos_en_curso-1);
        tamano_descuentos_en_curso -= 1; i += 1;
      }
      document.getElementById("loanformulary_descuentos_en_curso").value = descuentos_en_curso;
    }

    this.value = parseFloat(this.value.replace(/,/g, ""))
                    .toFixed(0)
                    .toString()
                    .replace(/\B(?=(\d{3})+(?!\d))/g, ".");

    document.getElementById("loanformulary_descuentos_en_curso").value = "$ "+this.value.replace(/,/g, "");
}

/*************************************
**  Función de reversión monetaria  **
*************************************/

function revertirMoneda() {
    var array_solicitado = document.getElementById("loanformulary_monto_solicitado").value.split(' ')[1].split('.');
    var tamano_solicitado = array_solicitado.length; var i = 0;
    var monto_solicitado = 0;
    while (tamano_solicitado > 0) {
      monto_solicitado += array_solicitado[i]*Math.pow(1000, tamano_solicitado-1);
      tamano_solicitado -= 1; i += 1;
    }
    document.getElementById("loanformulary_monto_solicitado").value = monto_solicitado;
    

    var array_aprobado = document.getElementById("loanformulary_monto_aprobado").value.split(' ')[1].split('.');
    var tamano_aprobado = array_aprobado.length; var i = 0;
    var monto_aprobado = 0;
    while (tamano_aprobado > 0) {
      monto_aprobado += array_aprobado[i]*Math.pow(1000, tamano_aprobado-1);
      tamano_aprobado -= 1; i += 1;
    }
    document.getElementById("loanformulary_monto_aprobado").value = monto_aprobado;


    var array_cuota = document.getElementById("loanformulary_monto_cuota").value.split(' ')[1].split('.');
    var tamano_cuota = array_cuota.length; var i = 0;
    var monto_cuota = 0;
    while (tamano_cuota > 0) {
      monto_cuota += array_cuota[i]*Math.pow(1000, tamano_cuota-1);
      tamano_cuota -= 1; i += 1;
    }
    document.getElementById("loanformulary_monto_cuota").value = monto_cuota;


    var array_renta_liquida = document.getElementById("loanformulary_renta_liquida").value.split(' ')[1].split('.');
    var tamano_renta_liquida = array_renta_liquida.length; var i = 0;
    var renta_liquida = 0;
    while (tamano_renta_liquida > 0) {
      renta_liquida += array_renta_liquida[i]*Math.pow(1000, tamano_renta_liquida-1);
      tamano_renta_liquida -= 1; i += 1;
    }
    document.getElementById("loanformulary_renta_liquida").value = renta_liquida;


    var array_finiquito = document.getElementById("loanformulary_fondo_finiquito").value.split(' ')[1].split('.');
    var tamano_finiquito = array_finiquito.length; var i = 0;
    var monto_finiquito = 0;
    while (tamano_finiquito > 0) {
      monto_finiquito += array_finiquito[i]*Math.pow(1000, tamano_finiquito-1);
      tamano_finiquito -= 1; i += 1;
    }
    document.getElementById("loanformulary_fondo_finiquito").value = monto_finiquito;


    var array_descuentos_en_curso = document.getElementById("loanformulary_descuentos_en_curso").value.split(' ')[1].split('.');
    var tamano_descuentos_en_curso = array_descuentos_en_curso.length; var i = 0;
    var descuentos_en_curso = 0;
    while (tamano_descuentos_en_curso > 0) {
      descuentos_en_curso += array_descuentos_en_curso[i]*Math.pow(1000, tamano_descuentos_en_curso-1);
      tamano_descuentos_en_curso -= 1; i += 1;
    }
    document.getElementById("loanformulary_descuentos_en_curso").value = descuentos_en_curso;
}
