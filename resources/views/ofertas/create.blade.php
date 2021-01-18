@extends(Auth::user()->tipo_usuario_id == '1' ? 'admin.layout' : (Auth::user()->tipo_usuario_id == '3' ?
'empresa.layout' : 'layout'))

@section('title', 'Registro Oferta')

@section('contenido')
    <center>
        <h1>Publicar Oferta Laboral</h1>
        <h3>Los campos con * son obligatorio <h3>
    </center>
    <br>
    <form action="{{ route('ofertas.store') }}" method="post">
        @csrf
        <input type="hidden" name="empresa_id" value="{{ $todos['empresa']->id }}">
        <div class="form-row">
            <div class="col-md-4 mb-3">
                <label>Titulo de la oferta laboral</label>
                <input type="text" class="form-control" name="titulo" placeholder="Nombre de la oferta laboral">
                @error('titulo')
                    <br>
                    <small>* {{ $message }}</small>
                    <br>
                @enderror
            </div>
            <div class="col-md-4 mb-3">
                <label>Celular</label>
                <input type="text" class="form-control" name="celular" placeholder="Celular">
                @error('celular')
                    <br>
                    <small>* {{ $message }}</small>
                    <br>
                @enderror
            </div>
            <div class="col-md-4 mb-3">
                <label>Telefono</label>
                <input type="number" class="form-control" name="telefono" placeholder="Telefono">
                <div class="valid-feedback">
                    Bien!
                </div>
            </div>
        </div>
        <div class="form-row">
            <div class="col-md-2 mb-3">
                <label>Vacantes</label>
                <input type="number" class="form-control" name="vacantes" placeholder="# cantidad de vacantes">
                @error('vacantes')
                    <br>
                    <small>* {{ $message }}</small>
                    <br>
                @enderror

            </div>
            <div class="col-md-2 mb-3">
                <label>Fecha de Vencimiento</label>
                <input type="date" class="form-control" min="{{ $todos['fecha'] }}" name="vencimiento"
                    placeholder="Fecha limite de oferta">
                @error('vencimiento')
                    <br>
                    <small>* {{ $message }}</small>
                    <br>
                @enderror
            </div>
            <div class="col-md-2 mb-3">
                <label>Tipo de Pago</label>
                <select class="custom-select" name="tipo_sueldo_id">
                    <option value="">Seleccionar Tipo de pago</option>
                    @foreach ($todos['tipo_sueldo'] as $tipo_sueldo)
                        <option value="{{ $tipo_sueldo->id }}">{{ $tipo_sueldo->nombre }}</option>
                    @endforeach
                </select>
                @error('tipo_sueldo_id')
                    <br>
                    <small>* {{ $message }}</small>
                    <br>
                @enderror

            </div>
            <div class="col-md-2 mb-3">
                <label>Tipo de contrato</label>
                <select class="custom-select" name="contrato_id">
                    <option value="">Seleccionar Hora laboral</option>
                    @foreach ($todos['contrato'] as $contrato)
                        <option value="{{ $contrato->id }}">{{ $contrato->nombre }}</option>
                    @endforeach
                </select>
                @error('contrato_id')
                    <br>
                    <small>* {{ $message }}</small>
                    <br>
                @enderror

            </div>
            <div class="col-md-2 mb-3">
                <label>Salario</label>
                <select class="custom-select" name="salario_id">
                    <option value="">Seleccionar Salario Mensual</option>
                    @foreach ($todos['salario'] as $salario)
                        <option value="{{ $salario->id }}">{{ $salario->nombre }}</option>
                    @endforeach
                </select>
                @error('salario_id')
                    <br>
                    <small>* {{ $message }}</small>
                    <br>
                @enderror

            </div>
            <div class="col-md-2 mb-3">
                <label>Carrera</label>
                <select class="custom-select" name="carrera_id">
                    <option value="">Seleccionar Carrera</option>
                    @foreach ($todos['carrera'] as $carrera)
                        <option value="{{ $carrera->id }}">{{ $carrera->nombre }}</option>
                    @endforeach
                </select>
                @error('carrera_id')
                    <br>
                    <small>* {{ $message }}</small>
                    <br>
                @enderror

            </div>
        </div>
        <div class="form-row">
            <div class="col-md-6 mb-3">
                <label>Requisitos</label>
                <textarea name="requisito" class="form-control" cols="30" rows="10"
                    placeholder="Requisitos para la oferta"></textarea>
            </div>
            <div class="col-md-6 mb-3">
                <label>Descripción de la oferta laboral</label>
                <textarea name="descripcion" class="form-control" cols="30" rows="10"
                    placeholder="Funciones a realizar"></textarea>
                <div class="valid-feedback">
                    Bien!
                </div>
            </div>
        </div>
        <div class="form-row">
            <div class="col-md-5 mb-3">
                <div class="form-check">
                    <input class="form-check-input" type="checkbox" value="" id="invalidCheck">
                    <label class="form-check-label" for="invalidCheck">//
                        Estoy de acuerdo con los terminos y condiciones
                    </label>
                </div>
            </div>
            <div class="col-md-2 mb-3">
                <button class="btn btn-primary" type="submit">Publicar Oferta Laboral</button>
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

    <script>
        $('.datepicker').datepicker({
            format: "dd/mm/yyyy",
            language: "es",
            autoclose: true
        });

    </script>


@endsection
