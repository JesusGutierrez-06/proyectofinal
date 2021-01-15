@extends(Auth::user()->tipo_usuario_id == '1' ? 'admin.layout' : (Auth::user()->tipo_usuario_id == '3' ?
'empresa.layout' : 'layout'))
@section('title', 'Registro Empresa')

@section('contenido')

    <center>
        <h1>Registrar Empresa</h1>
        <h3>Los campos con * son obligatorio <h3>
    </center>
    <form action="{{ route('empresa.store') }}" enctype="multipart/form-data" method="post">
        @csrf
        <input type="hidden" name="users_id" value="{{ $todos['admin'] }}">
        <div class="form-row">
            <div class="col-md-4 mb-3">
                <label>Razón social</label>
                <input type="text" name="nombre" class="form-control" placeholder="Nombre,Razón social, Denominación">
                @error('nombre')
                    <br>
                    <small>* {{ $message }}</small>
                    <br>
                @enderror
            </div>
            <div class="col-md-4 mb-3">
                <label>Dirección</label>
                <input type="text" name="direccion" class="form-control" placeholder="Calle o Avenida">
                @error('direccion')
                    <br>
                    <small>* {{ $message }}</small>
                    <br>
                @enderror

            </div>
            <div class="col-md-4 mb-3">
                <label for="validationCustom02">Departamento</label>
                <select class="custom-select" id="departamento" name="dpto_id">
                    <option value="">Seleccionar departamento</option>
                    @foreach ($todos['departamento'] as $departamentos)
                        <option value="{{ $departamentos->id }}">{{ $departamentos->nombre }}</option>
                    @endforeach
                </select>
                @error('dpto_id')
                    <br>
                    <small>* {{ $message }}</small>
                    <br>
                @enderror
            </div>

        </div>
        <div class="form-row">
            <div class="col-md-4 mb-3">
                <label for="validationCustom01">Celular</label>
                <input type="text" name="celular" class="form-control" id="validationCustom01" placeholder="Celular">
                @error('celular')
                    <br>
                    <small>* {{ $message }}</small>
                    <br>
                @enderror
            </div>
            <div class="col-md-4 mb-3">
                <label for="validationCustom02">Telefono</label>
                <input type="text" name="telefono" class="form-control" id="validationCustom02" placeholder="Telefono">
                @error('telefono')
                    <br>
                    <small>* {{ $message }}</small>
                    <br>
                @enderror
            </div>
            <div class="col-md-4 mb-3">
                <label for="validationCustom01">Pagina Web</label>
                <input type="text" name="url_pagina" class="form-control" id="validationCustom01"
                    placeholder="www.example.com">
                @error('url_pagina')
                    <br>
                    <small>* {{ $message }}</small>
                    <br>
                @enderror
            </div>
        </div>
        <div class="form-row">
            <div class="col-md-4 mb-3">
                <label for="validationCustom01">Objeto de la Empresa</label>
                <input type="text" name="descripcion" class="form-control" id="validationCustom01"
                    placeholder="A que se dedica la empresa">
                @error('descripcion')
                    <br>
                    <small>* {{ $message }}</small>
                    <br>
                @enderror
            </div>
            <div class="col-md-4 mb-3">
                <label for="validationCustom01">Nit</label>
                <input type="text" name="nit" class="form-control" id="validationCustom01"
                    placeholder="Número de identificación tributaria">
                @error('nit')
                    <br>
                    <small>* {{ $message }}</small>
                    <br>
                @enderror
            </div>
            <div class="col-md-4 mb-3">
                <label for="validationCustom01">Logo de la empresa</label>
                <input type="file" accept="image/*" name="image">
                @error('logo')
                    <br>
                    <small>* {{ $message }}</small>
                    <br>
                @enderror
            </div>
        </div>
        <div class="form-row">
            <div class="col-md-5 mb-3">
                <div class="form-check">
                    <input class="form-check-input" type="checkbox" value="" id="invalidCheck">
                    <label class="form-check-label" for="invalidCheck">//
                        Estoy de acuerdo con los terminos y condiciones
                    </label>
                    <div class="invalid-feedback">
                        You must agree before submitting.
                    </div>
                </div>
            </div>
            <div class="col-md-2 mb-3">
                <button class="btn btn-primary" type="submit">Siguiente</button>
            </div>
    </form>
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
