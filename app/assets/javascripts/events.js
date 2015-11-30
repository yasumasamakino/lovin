$(document).ready(function(){

$("#search_event").click(function () {

  var kaisaidate = $("#kaisaidate").val();
  var area ="";
  $(':checkbox[name="area"]:checked').each(function(index, checkbox) {
    area += $(checkbox).val() + "_";
  });
  area =  area.substr( 0 , (area.length-1) );
  var fw = $("#fw").val();

  var url =  "/events" + "?kaisaidate=" + kaisaidate + "&fw=" + fw + "&area=" + area; // リクエスト先URL
  window.location.href = url;

});



});
