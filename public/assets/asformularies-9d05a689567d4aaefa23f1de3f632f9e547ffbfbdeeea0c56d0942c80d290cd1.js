(function() {
  $(document).ready(function() {
    return $(".areabenefit_selection").on("change", function() {
      return $.ajax({
        url: "/asformularies/get_benefits",
        type: "GET",
        dataType: "script",
        data: {
          areabenefit_id: $('.areabenefit_selection option:selected').val()
        }
      });
    });
  });

}).call(this);
