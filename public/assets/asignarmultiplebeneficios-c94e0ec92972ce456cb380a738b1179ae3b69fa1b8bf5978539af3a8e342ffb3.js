(function() {
  $(document).ready(function() {
    $(".company_selection").on("change", function() {
      return $.ajax({
        url: "/asignarmultiplebeneficios/get_contacts",
        type: "GET",
        dataType: "script",
        data: {
          areabenefit_id: $('.company_selection option:selected').val()
        }
      });
    });
    return $(".ccosto_selection").on("change", function() {
      return $.ajax({
        url: "/asignarmultiplebeneficios/get_trabajadorporobra",
        type: "GET",
        dataType: "script",
        data: {
          obra_id: $('.ccosto_selection option:selected').val()
        }
      });
    });
  });

}).call(this);
