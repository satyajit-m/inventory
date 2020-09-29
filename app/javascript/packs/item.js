$(document).on("turbolinks:load", function () {
  jQuery(function () {
    $(".item-status").click(function (evt) {
      if ($(this).val() == "true") {
        $(".employee-select").removeClass("d-none");
        $(".employee-select").show();
      } else {
        $(".employee-select").hide();
      }
    });
  });
});
