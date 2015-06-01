<%-- 
    Document   : footer
    Created on : 1/04/2015, 12:39:52 AM
    Author     : lalo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<script type="text/javascript">

$( document ).ready(function() {
  $('body').fadeIn(2500);
});
$("#pass").keypress(function(key) {
  if(key.charCode == 39) return false;
});

$("#pass_c").keypress(function(key) {
  if(key.charCode == 39) return false;
});

</script>
<script type="text/javascript" src="public/js/validando.js"></script>
<script type="text/javascript" src="public/js/bootstrapValidator.min.js"></script>
<script type="text/javascript" src="public/js/validCampo.js"></script>
<script type="text/javascript" src="public/js/jquery.validate.js"></script>

<script type="text/javascript" src="public/js/bootstrap.min.js"></script>