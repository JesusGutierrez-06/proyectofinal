@extends(Auth::user()->tipo_usuario_id == '1' ? 'admin.layout' : (Auth::user()->tipo_usuario_id == '2' ?
'estudiante.layout' : 'layout'))
@section('title', 'Registro Candidato')

@section('contenido')

    @if (!empty($data['estudios'][0]))

        <center>
            <h3>
                Listado de mis estudios
            </h3>
        </center>
        <table class="table titulo table-responsive-xl">
            <thead class="table-color">
                <tr>
                    <th>N° Registro</th>
                    <th>Semestre</th>
                    <th>Institución</th>
                    <th>Carrera</th>
                    <th>Fecha de Inscripción</th>
                    <th>Fecha de Finalización</th>
                    <th>Acciones</th>
                </tr>
            </thead>
            <tbody>
                @foreach ($data['estudios'] as $user)
                    <tr>
                        <th>{{ $user->id }}</th>
                        <td>{{ $user->semestre }}</td>
                        <td>{{ $user->institucion }}</td>
                        <td>{{ $user->carrera }}</td>
                        <td>{{ $user->fechainicio }}</td>
                        <td>{{ $user->fechafin }}</td>
                        <td>Menu</td>
                    </tr>
                @endforeach
            </tbody>
        </table>

    @else
        <h1>No existen datos de estudios registrados</h1>
    @endif
    @if (!empty($data['capacitacion'][0]))

        <center>
            <h3>
                Listado de mis cursos / certificados de estudios
            </h3>
        </center>
        <table class="table titulo table-responsive-xl">
            <thead class="table-color">
                <tr>
                    <th>N° de Registro</th>
                    <th>Titulo</th>
                    <th>Institución</th>
                    <th>Area de Capacitación</th>
                    <th>Tipo de Capacitación</th>
                    <th>Fecha de Inscripción</th>
                    <th>Fecha de Finalización</th>
                    <th>Acciones</th>
                </tr>
            </thead>
            <tbody>
                @foreach ($data['capacitacion'] as $user)
                    <tr>
                        <th>{{ $user->id }}</th>
                        <td>{{ $user->nombre }}</td>
                        <td>{{ $user->institucion }}</td>
                        <td>{{ $user->area_capa }}</td>
                        <td>{{ $user->tipo_capa }}</td>
                        <td>{{ $user->fechainicio }}</td>
                        <td>{{ $user->fechafin }}</td>
                        <td>Menu</td>
                    </tr>
                @endforeach
            </tbody>
        </table>

    @else
        <h1>No existen datos de capacitaciones registradas</h1>
    @endif
    <div class="card-header">
        <div class="form-row">

            <div class="card col-md-6 mb-2">
                <center>
                    <h1>Estudios Académicos</h1>
                </center>
                <form action="{{ route('estudios.store') }}" enctype="multipart/form-data" method="post">
                    @csrf
                    <div class="form-row">
                        <div class="col-md-12 mb-3">
                            <label>Institución / Colegio</label>
                            <input type="text" class="form-control" name="institucion"
                                placeholder="Nombre de la institución">
                        </div>
                    </div>
                    <div class="form-row">
                        <div class="col-md-6 mb-3">
                            <label>Año / Semestre</label>
                            <input type="text" class="form-control" name="semestre" placeholder="Cursando o finalizado">
                        </div>
                        <div class="col-md-6 mb-3">
                            <label>Carrera</label>
                            <select class="custom-select" name="carrera_id">
                                <option value="">Seleccionar Genero</option>
                                @foreach ($data['carrera'] as $carrera)
                                    <option value="{{ $carrera->id }}">{{ $carrera->nombre }}</option>
                                @endforeach
                            </select>
                        </div>
                    </div>
                    <div class="form-row">
                        <div class="col-md-6 mb-3">
                            <label>Fecha de Inscripción</label>
                            <input type="text" class="form-control" name="fechainicio" placeholder="YYYY-mm-dd">
                        </div>
                        <div class="col-md-6 mb-3">
                            <label>Fecha de Finalización</label>
                            <input type="text" class="form-control" name="fechafin" placeholder="YYYY-mm-dd">
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
                    <h1>Cursos / Certificados</h1>
                </center>
                <form action="{{ route('capacitacion.store') }}" enctype="multipart/form-data" method="post">
                    @csrf
                    <div class="form-row">
                        <div class="col-md-6 mb-3">
                            <label>Titulo</label>
                            <input type="text" class="form-control" name="nombre" placeholder="Cursando o finalizado">
                        </div>
                        <div class="col-md-6 mb-3">
                            <label>Institución</label>
                            <input type="text" class="form-control" name="institucion"
                                placeholder="Nombre de la institución">
                        </div>
                    </div>
                    <div class="form-row">
                        <div class="col-md-6 mb-3">
                            <label>Capacitacion</label>
                            <select class="custom-select" name="area_capa_id">
                                <option value="">Seleccionar Area Capacitacion</option>
                                @foreach ($data['area_capa'] as $area_capa)
                                    <option value="{{ $area_capa->id }}">{{ $area_capa->nombre }}</option>
                                @endforeach
                            </select>
                        </div>
                        <div class="col-md-6 mb-3">
                            <label>Tipo de Capacitacion</label>
                            <select class="custom-select" name="tipo_capa_id">
                                <option value="">Seleccionar Tipo Capacitacion</option>
                                @foreach ($data['tipo_capa'] as $tipo_capa)
                                    <option value="{{ $tipo_capa->id }}">{{ $tipo_capa->nombre }}</option>
                                @endforeach
                            </select>
                        </div>
                    </div>
                    <div class="form-row">
                        <div class="col-md-6 mb-3">
                            <label>Fecha de Inscripción</label>
                            <input type="text" class="form-control" name="fechainicio" placeholder="YYYY-mm-dd">
                        </div>
                        <div class="col-md-6 mb-3">
                            <label>Fecha de Finalización</label>
                            <input type="text" class="form-control" name="fechafin" placeholder="YYYY-mm-dd">
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
    </div>
    @endsection
