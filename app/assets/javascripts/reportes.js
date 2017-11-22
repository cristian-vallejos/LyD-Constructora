function showReportePorObra() {
    document.getElementById("reporte_por_obra").style.display = 'block';
    $("#reportePorObra h3").css("color", 'black');
    $("#reportePorObra h3").addClass("sub-menu-reportes");
    $("#reporteGeneral h3").removeClass("sub-menu-reportes");
    document.getElementById("reporte_general").style.display = 'none';
    $("#reporteGeneral h3").css("color", '#6E6C64');
}

function showReporteGeneral() {
    document.getElementById("reporte_por_obra").style.display = 'none';
    $("#reporteGeneral h3").css("color", 'black');
    $("#reporteGeneral h3").addClass("sub-menu-reportes");
    $("#reportePorObra h3").removeClass("sub-menu-reportes");
    document.getElementById("reporte_general").style.display = 'block';
    $("#reportePorObra h3").css("color", '#6E6C64');
}
