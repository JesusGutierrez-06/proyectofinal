@extends(Auth::user()->tipo_usuario_id == '1' ? 'admin.layout' : (Auth::user()->tipo_usuario_id == '2' ?
'estudiante.layout' : 'layout'))
@section('title', 'Registro Estudiante')
@section('contenido')
    <center>
        <h1>Registrar Estudiantes</h1>
        <h3>Los campos con * son obligatorio <h3>
    </center>
    <form action="{{ route('estudiante.store') }}" enctype="multipart/form-data" method="post">
        @csrf
        <input type="hidden" name="users_id" value="{{ $todos['admin']->id }}">
        <div class="form-row">
            <div class="col-md-4 mb-3">
                <label>Nombre</label>
                <input type="text" class="form-control" name="nombre" value="" placeholder="Nombre">
            </div>
            <div class="col-md-4 mb-3">
                <label>Apellido Paterno</label>
                <input type="text" class="form-control" name="apellidop" placeholder="Apellido Paterno">
            </div>
            <div class="col-md-4 mb-3">
                <label>Apellido Materno</label>
                <input type="text" class="form-control" name="apellidom" placeholder="Apellido Materno">
            </div>
        </div>
        <div class="form-row">
            <div class="col-md-4 mb-3">
                <label>Matricula</label>
                <input type="text" class="form-control" name="matricula" placeholder="Matriula estudiantil">
            </div>
            <div class="col-md-2 mb-3">
                <label>Celular</label>
                <input type="text" class="form-control" name="celular" placeholder="Celular">
            </div>
            <div class="col-md-2 mb-3">
                <label>Telefono</label>
                <input type="text" class="form-control" name="telefono" placeholder="Telefono">
            </div>
            <div class="col-md-4 mb-3">
                <label>Fotografía</label>
                <div class="custom-file">
                    <input type="file" name="image" accept="image/*" class="custom-file-input" id="validatedCustomFile"
                        required>
                    <label class="custom-file-label" for="validatedCustomFile">Choose file...</label>
                    <div class="invalid-feedback">Example invalid custom file feedback</div>
                </div>
            </div>
        </div>
        <div class="form-row">
            <div class="col-md-4 mb-3">
                <label>Documento de Identidad</label>
                <input type="text" class="form-control" name="dni" placeholder="C.I.">
            </div>
            <div class="col-md-2 mb-3">
                <label>Fecha Nacimiento</label>
                <input type="text" class="form-control" name="fechanac" placeholder="2000-11-01">
            </div>
            <div class="col-md-2 mb-3">
                <label>Genero</label>
                <select class="custom-select" id="genero" name="genero_id">
                    <option value="">Seleccionar Genero</option>
                    @foreach ($todos['genero'] as $generos)
                        <option value="{{ $generos->id }}">{{ $generos->nombre }}</option>
                    @endforeach
                </select>
            </div>
            <div class="col-md-2 mb-3">
                <label>Estado Civil</label>
                <select class="custom-select" id="estado_civil" name="estado_civil_id">
                    <option value="">Seleccionar estado civil</option>
                    @foreach ($todos['estado_civil'] as $estados_civiles)
                        <option value="{{ $estados_civiles->id }}">{{ $estados_civiles->nombre }}</option>
                    @endforeach
                </select>
            </div>
            <div class="col-md-2 mb-3">
                <label>Grupo sanguineo</label>
                <select class="custom-select" id="tipo_sangre" name="tipo_sangre_id">
                    <option value="">Seleccionar tipo de sangre</option>
                    @foreach ($todos['tipo_sangre'] as $tipos_sangres)
                        <option value="{{ $tipos_sangres->id }}">{{ $tipos_sangres->nombre }}</option>
                    @endforeach
                </select>
            </div>
        </div>
        <div class="form-row">
            <div class="col-md-4 mb-3">
                <label>Departamento</label>
                <select class="custom-select" id="departamento" name="departamento_id">
                    <option value="">Seleccionar departamento</option>
                    @foreach ($todos['departamento'] as $departamentos)
                        <option value="{{ $departamentos->id }}">{{ $departamentos->nombre }}</option>
                    @endforeach
                </select>
            </div>
            <div class="col-md-4 mb-3">
                <label>Provincia</label>
                <select class="custom-select" id="provincia" name="provincia_id">
                    <option value="">Seleccionar provincia</option>
                    @foreach ($todos['provincia'] as $provincias)
                        <option value="{{ $provincias->id }}">{{ $provincias->nombre }}</option>
                    @endforeach
                </select>
            </div>
            <div class="col-md-4 mb-3">
                <label>Domicilio</label>
                <input type="text" class="form-control" name="direccion" placeholder="Barrio / Calle">
            </div>
        </div>
        <div class="form-row">
            <div class="col-md-5 mb-3">
                <div class="form-check">
                    <input class="form-check-input" type="checkbox" value="" id="invalidCheck">
                    <label class="form-check-label">
                        Estoy de acuerdo con los terminos y condiciones
                    </label>
                    <div class="invalid-feedback">
                        You must agree before submitting.
                    </div>
                </div>
            </div>
            <div class="col-md-2 mb-3">
                <button class="btn btn-primary" type="submit">Crear Usuario</button>
            </div>
            <div class="col-md-5 mb-3">
            </div>
        </div>
    </form>
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
