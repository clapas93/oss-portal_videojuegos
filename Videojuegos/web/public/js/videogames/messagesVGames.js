$('.deleteCM').on('click', function () {
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
