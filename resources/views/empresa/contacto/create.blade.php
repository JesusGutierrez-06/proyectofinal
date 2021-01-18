@extends(Auth::user()->tipo_usuario_id == '1' ? 'admin.layout' : (Auth::user()->tipo_usuario_id == '3' ?
'empresa.layout' : 'layout'))
@section('title','Registro Empresa')
    
@section('contenido')
    
<center> <h1>Registrar Datos de contacto</h1>
<h3>Los campos con * son obligatorio <h3></center>
  <form action="{{route('contacto.store')}}" method="post" >
    @csrf
    <input type="hidden" name="users_id" value="{{$todos['admin']}}">
    <input type="hidden" name="empresa_id" value="{{$todos['empresa']}}">
<div class="form-row">
  <div class="col-md-3 mb-3">
    <label >Nombre de representante legal</label>
    <input type="text" class="form-control" name="nombre" placeholder="Nombre de representante legal o propietario">
    @error('nombre')
          <br>
          <small>* {{$message}}</small>
          <br>
      @enderror
  </div>

  <div class="col-md-3 mb-3">
    <label >Celular</label>
    <input type="text" maxlength="8" name="celular" class="form-control" placeholder="Celular">
    @error('celular')
          <br>
          <small>* {{$message}}</small>
          <br>
      @enderror
  </div>
  <div class="col-md-3 mb-3">
    <label for="validationCustom02">Telefono</label>
    <input type="text" maxlength="9" name="telefono" class="form-control" id="validationCustom02" placeholder="Telefono" >
    @error('telefono')
          <br>
          <small>* {{$message}}</small>
          <br>
      @enderror
  </div>
</div>
<div class="form-row">
    <div class="col-md-5 mb-3">
        <div class="form-check">
            <input class="form-check-input" type="checkbox" value="" id="invalidCheck" required>
            <label class="form-check-label" for="invalidCheck">//
             Estoy de acuerdo con los terminos y condiciones
            </label>
            <div class="invalid-feedback">
              You must agree before submitting.
            </div>
          </div>
         </div>
      <div class="col-md-2 mb-3">
        <button class="btn btn-primary" type="submit">Enviar</button>
    </form>        
      </div>
      <div class="col-md-5 mb-3">  
      </div>
</div>
<script>
// Example starter JavaScript for disabling form submissions if there are invalid fields
(function() {
'use strict';
window.addEventListener('load', function() {
  // Fetch all the forms we want to apply custom Bootstrap validation styles to
  var forms = document.getElementsByClassName('needs-validation');
  // Loop over them and prevent submission
  var validation = Array.prototype.filter.call(forms, function(form) {
    form.addEventListener('submit', function(event) {
      if (form.checkValidity() === false) {
        event.preventDefault();
        event.stopPropagation();
      }
      form.classList.add('was-validated');
    }, false);
  });
}, false);
})();
</script>

@endsection