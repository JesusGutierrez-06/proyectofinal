@extends(Auth::user()->tipo_usuario_id == '1' ? 'admin.layout' : (Auth::user()->tipo_usuario_id == '2' ?
'estudiante.layout' : 'layout'))
@section('title', 'Registro Candidato')
@section('contenido')
    @if (!empty($data['exp_laboral'][0]))
        <center>
            <h3>
                Listado de mis Experiencias Laborales
            </h3>
        </center>
        <table class="table titulo table-responsive-xl">
            <thead class="table-color">
                <tr>
                    <th>N° Registro</th>
                    <th>Area Laboral</th>
                    <th>Institución</th>
                    <th>Cargo</th>
                    <th>Fecha de Ingreso</th>
                    <th>Fecha de Finalización</th>
                    <th>Descripción</th>
                    <th>Acciones</th>
                </tr>
            </thead>
            <tbody>
                @foreach ($data['exp_laboral'] as $user)
                    <tr>
                        <th>{{ $user->id }}</th>
                        <td>{{ $user->area_laboral }}</td>
                        <td>{{ $user->institucion }}</td>
                        <td>{{ $user->puesto }}</td>
                        <td>{{ $user->fechainicial }}</td>
                        <td>{{ $user->fechafin }}</td>
                        <td>{{ $user->descripcion }}</td>
                        <td>Menu</td>
                    </tr>
                @endforeach
            </tbody>
        </table>

    @else
        <h1>No existen datos de experiencias laborales registradas</h1>
    @endif

    @if (!empty($data['estudios_idioma'][0]))

        <center>
            <h3>
                Listado de Idiomas agregados
            </h3>
        </center>
        <table class="table titulo table-responsive-xl">
            <thead class="table-color">
                <tr>
                    <th>N° Registro</th>
                    <th>Idioma</th>
                    <th>Hablar</th>
                    <th>Escribir</th>
                    <th>Leer</th>
                    <th>Acciones</th>
                </tr>
            </thead>
            <tbody>
                @foreach ($data['estudios_idioma'] as $user)
                    <tr>
                        <th>{{ $user->id }}</th>
                        <td>{{ $user->idioma }}</td>
                        <td>{{ $user->hablar }}</td>
                        <td>{{ $user->escribir }}</td>
                        <td>{{ $user->leer }}</td>
                        <td>Menu</td>
                    </tr>
                @endforeach
            </tbody>
        </table>

    @else
        <h1>No existen datos de idiomas registrados</h1>
    @endif
    <div class="form-row">

        <div class="card col-md-6 mb-2">
            <center>
                <h1>Experiencia Laboral</h1>
            </center>
            <form action="{{ route('exp_laboral.store') }}" enctype="multipart/form-data" method="post">
                @csrf
                <div class="form-row">
                    <div class="col-md-6 mb-3">
                        <label>Institución</label>
                        <input type="text" class="form-control" name="institucion" placeholder="Nombre de la institución">
                        @error('institucion')
                            <br>
                            <small>* {{ $message }}</small>
                            <br>
                        @enderror
                    </div>
                    <div class="col-md-6 mb-3">
                        <label>Descripción del cargo</label>
                        <input type="text" class="form-control" name="descripcion" placeholder="Funciones que realizaba">
                        @error('descripcion')
                            <br>
                            <small>* {{ $message }}</small>
                            <br>
                        @enderror
                    </div>
                </div>
                <div class="form-row">
                    <div class="col-md-6 mb-3">
                        <label>Cargo</label>
                        <input type="text" class="form-control" name="puesto" placeholder="Actividad a realizar">
                        @error('puesto')
                            <br>
                            <small>* {{ $message }}</small>
                            <br>
                        @enderror
                    </div>
                    <div class="col-md-6 mb-3">
                        <label>Area Laboral</label>
                        <select class="custom-select" name="area_laboral_id">
                            <option value="">Seleccionar una Area</option>
                            @foreach ($data['area_laboral'] as $area_laboral)
                                <option value="{{ $area_laboral->id }}">{{ $area_laboral->nombre }}</option>
                            @endforeach
                        </select>
                        @error('area_laboral_id')
                            <br>
                            <small>* {{ $message }}</small>
                            <br>
                        @enderror
                    </div>
                </div>
                <div class="form-row">
                    <div class="col-md-6 mb-3">
                        <label>Fecha de Inscripción</label>
                        <input  type="date" max="{{ $data['fecha'] }}" class="form-control" name="fechainicial" placeholder="YYYY-mm-dd">
                        @error('fechainicial')
                            <br>
                            <small>* {{ $message }}</small>
                            <br>
                        @enderror
                    </div>
                    <div class="col-md-6 mb-3">
                        <label>Fecha de Finalización</label>
                        <input type="date" class="form-control" name="fechafin" placeholder="YYYY-mm-dd">
                        @error('fechafin')
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
                            <label class="form-check-label">
                                Estoy de acuerdo con los terminos y condiciones
                            </label>
                            <div class="invalid-feedback">
                                You must agree before submitting.
                            </div>
                        </div>
                    </div>
                    <div class="col-md-5 mb-3">
                        <button class="btn btn-primary" type="submit">Guardar Estudio</button>
                    </div>
                    <div class="col-md-2 mb-3">
                    </div>
                </div>

            </form>
        </div>

        <div class="card col-md-6 mb-2">
            <center>
                <h1>Agregar Idioma</h1>
            </center>
            <form action="{{ route('estudiosidioma.store') }}" enctype="multipart/form-data" method="post">
                @csrf
                <div class="form-row">
                    <div class="col-md-12 mb-3">
                        <label>Idioma</label>
                        <select class="custom-select" name="idioma_id">
                            <option value="">Seleccionar Idioma</option>
                            @foreach ($data['idioma'] as $idioma)
                                <option value="{{ $idioma->id }}">{{ $idioma->nombre }}</option>
                            @endforeach
                        </select>
                        @error('idioma_id')
                            <br>
                            <small>* {{ $message }}</small>
                            <br>
                        @enderror
                    </div>
                </div>
                <div class="form-row">
                    <div class="col-md-4 mb-3">
                        <label>Hablar</label>
                        <select class="custom-select" name="hablar">
                            <option value="">Seleccionar</option>
                            <option value="Básico">Básico</option>
                            <option value="Intermedio">Intermedio</option>
                            <option value="Avanzado">Avanzado</option>
                        </select>
                        @error('hablar')
                            <br>
                            <small>* {{ $message }}</small>
                            <br>
                        @enderror
                    </div>
                    <div class="col-md-4 mb-3">
                        <label>Escribir</label>
                        <select class="custom-select" name="escribir">
                            <option value="">Seleccionar</option>
                            <option value="Básico">Básico</option>
                            <option value="Intermedio">Intermedio</option>
                            <option value="Avanzado">Avanzado</option>
                        </select>
                        @error('escribir')
                            <br>
                            <small>* {{ $message }}</small>
                            <br>
                        @enderror
                    </div>
                    <div class="col-md-4 mb-3">
                        <label>Leer</label>
                        <select class="custom-select" name="leer">
                            <option value="">Seleccionar</option>
                            <option value="Básico">Básico</option>
                            <option value="Intermedio">Intermedio</option>
                            <option value="Avanzado">Avanzado</option>
                        </select>
                        @error('leer')
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
                            <label class="form-check-label">
                                Estoy de acuerdo con los terminos y condiciones
                            </label>
                            <div class="invalid-feedback">
                                You must agree before submitting.
                            </div>
                        </div>
                    </div>
                    <div class="col-md-5 mb-3">
                        <button class="btn btn-primary" type="submit">Guardar Curso</button>
                    </div>
                    <div class="col-md-2 mb-3">
                    </div>
                </div>
            </form>
        </div>
    </div>
@endsection
