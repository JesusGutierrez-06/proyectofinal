@extends(Auth::user()->tipo_usuario_id == '1' ? 'admin.layout' : (Auth::user()->tipo_usuario_id == '2' ?
'estudiante.layout' : 'layout'))
@section('title', 'Registro Candidato')

@section('contenido')

    <center>
        <h1>Datos Personales</h1>
    </center>
    <div class="form-row">
        <div class="col-md-6 mb-2">

            <table style="text-align: center" class="table table-hover table-responsive-xl">
                <tbody>
                    <tr>
                        <th class="table-color" scope="col">Nombre :</th>
                        <th scope="col">{{ $data['estudiante']->nombre }} {{ $data['estudiante']->apellidop }}
                            {{ $data['estudiante']->apellidom }}
                        </th>
                    </tr>
                    <tr>
                        <th class="table-color" scope="col">Matricula :</th>
                        <th scope="col">{{ $data['estudiante']->matricula }}
                    </tr>
                    <tr>
                        <th class="table-color" scope="col">Celular/Telf :</th>
                        <th scope="col">{{ $data['estudiante']->celular }} - {{ $data['estudiante']->telefono }}
                    </tr>
                    <tr>
                        <th class="table-color" scope="col">Carnet de Identidad :</th>
                        <th scope="col">{{ $data['estudiante']->dni }}
                    </tr>
                    <tr>
                        <th class="table-color" scope="col">Genero :</th>
                        <th scope="col"> {{ $data['genero']->nombre }}
                    </tr>

                </tbody>
            </table>
        </div>
        <div class="col-md-6 mb-2">

            <table style="text-align: center" class="table table-hover table-responsive-xl">
                <tbody>
                    <tr>
                        <th class="table-color" scope="col">Grupo Sanguineo :</th>
                        <th scope="col">{{ $data['tipo_sangre']->nombre }} </th>
                    </tr>
                    <tr>
                        <th class="table-color" scope="col">Fecha Nacimiento :</th>
                        <th scope="col">{{ $data['estudiante']->fechanac }}
                    </tr>
                    <tr>
                        <th class="table-color" scope="col">Domicilio :</th>
                        <th scope="col"> {{ $data['estudiante']->direccion }}
                    </tr>
                    <tr>
                        <th class="table-color" scope="col">Departamento :</th>
                        <th scope="col"> {{ $data['departamento']->nombre }} - {{ $data['provincia']->nombre }}
                    </tr>
                    <tr>
                        <th class="table-color" scope="col">Email :</th>
                        <th scope="col"> {{ $data['users']->email }}
                    </tr>
                </tbody>
            </table>
        </div>
    </div>
    <center>
        <h1>Datos académicos</h1>
    </center>
    @if (!empty($data['estudios'][0]))

        <center>
            <h3>
                Listado de mis estudios
            </h3>
        </center>
        <table class="table titulo table-responsive-xl">
            <thead class="table-color">
                <tr>
                    <th>N° de Registro</th>
                    <th>Semestre</th>
                    <th>Institución</th>
                    <th>Carrera</th>
                    <th>Fecha de Inscripción</th>
                    <th>Fecha de Finalización</th>
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
                    </tr>
                @endforeach
            </tbody>
        </table>

    @else
        <h1>No existen datos de capacitaciones registradas</h1>
    @endif
@endsection
