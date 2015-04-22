$('.deleteCM').on('click', function () {
  var id = $(this).attr('row');
  var vid = $(this).val();
  console.log(vid);
  $.confirm({
    title: 'Eliminar Videojuego',
    keyboardEnabled: true,
    content: '¿Estas seguro de que quieres eliminar el videojuego?',
    confirmButton: 'Si',
    cancelButton:'No',
    confirmButtonClass: 'btn-danger',
    cancelButtonClass: 'btn-info',
    animation: 'bottom',
    confirm: function () {
      var name = "#row"+id;   
      $.ajax({
        type: "POST",
          url: 'deleteVideogame',
          dataType: "json",
          data:{idGame:vid},
          success: function(data){
            console.log(data);
            $(name).remove();
          },
          error: function(data){
            console.log(data);
          }
      });
      $.alert({
        title: 'Videojuego Eliminado',
        keyboardEnabled: true,
        content: 'El videojuego ha sido eliminado',
        confirmButton: 'Aceptar',
        confirmButtonClass: 'btn-success',
        animation: 'top',
        /*confirm: function () {
            var val = this.$b.find('input').val();
            if(val == '1'){
                alert('hola')
            }
            if(val=='2'){
                console.log(this.content);
            }
            else{ return false;}
          }*/
        });
    }
  });
});
