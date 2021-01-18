@extends(Auth::user()->tipo_usuario_id == '1' ? 'admin.layout' : 'layout')
@section('title', 'Home')
@section('contenido')
    <div class="card-header">
        <center>
            <h2>Lista de Estudiantes</h2>
        </center>
        <a class="btn btn-sm btn-danger" href="{{ route('reportes.estudiante') }}">PDF</a>
        <ul class="navbar-nav ml-auto float-right">
            <li class="nav-item">
                <a class="nav-link icon" href="{{ route('admin.create') }}" role="button">
                    <i class="fas fa-user-plus"></i>Nuevo Usuario
                </a>
                <div class="navbar-search-block">
                    <form class="form-inline">
                        <select name="tipo" class="from-control mr-sm-2">
                            <option>Buscar por</option>
                            <option value="nombre">Nombres</option>
                            <option value="apellidop">Apellido Paterno</option>
                            <option value="dni">Carnet</option>
                        </select>
                        <div class="input-group input-group-sm ">
                            <input name="buscar" class="form-control form-control-navbar" type="search" placeholder="Buscar por Nombre, Apellido, DNI"
                                aria-label="Search" value="{{ $buscar }}">
                            <div class="input-group-append">
                                <button class="btn btn-navbar" type="submit">
                                    <i class="fas fa-search"></i>
                                </button>
                            </div>
                        </div>
                    </form>
                </div>
            </li>
        </ul>
        <table style="text-align: center" class="table table-hover table-responsive-xl">
            <thead class="table-color">
                <tr>
                    <th scope="col">#</th>
                    <th scope="col">Nombre</th>
                    <th scope="col">Celular / Telefono</th>
                    <th scope="col">DNI</th>
                    <th scope="col">Lugar Nac.</th>
                    <th scope="col">Estado</th>
                    <th scope="col">Fecha de creación</th>
                    <th scope="col">Hoja de vida</th>
                </tr>
            </thead>
            <tbody>
                @foreach ($data as $user)
                    <tr>
                        <th scope="row">{{ $user->id }}</th>
                        <td>{{ $user->nombre }} {{ $user->apellidop }} {{ $user->apellidom }}</td>
                        <td>{{ $user->celular }} / {{ $user->telefono }}</td>
                        <td>{{ $user->dni }}</td>
                        <td>{{ $user->departamento }} - {{ $user->provincia }}</td>
                        <?php if ($user->estado == '1') {
                        echo '<td class="badge" style="background-color: #00796b; color:white;">Activo</td>';
                        } elseif ($user->estado == '0') {
                        echo '<td class="badge badge-danger">Inacctivo</td>';
                        } ?>
                        <td>{{ $user->created_at }}</td>
                        <td>
                            <form action="{{ route('estudiante.destroy', $user->id) }}" class="formulario" method="post">
                                @csrf @method('DELETE')
                                <a href="{{ route('estudiante.show', $user->id) }}"><i title="Ver más"
                                        class="fa fa-eye icon"> </i></a>
                                <a href="{{ route('estudiante.edit', $user->id) }}"><i title="Editar"
                                        class="fa fa-edit icon"></i></a>
                                @if ($user->estado == '0')
                                    <input type="hidden" name="estado" value="1">
                                    <button class="btn-delete" onclick="confirmar();"><i class="fas fa-bullseye icon"></i>
                                    </button>
                                @else
                                    <input type="hidden" name="estado" value="0">
                                    <button class="btn-delete" onclick="confirmar();"><i class="fas fa-trash-alt icon"></i>
                                    </button>
                                @endif
                            </form>
                        </td>
                    </tr>
                @endforeach
            </tbody>
        </table>
        <nav aria-label="Page navigation example " class="float-right">
            <ul class="pagination">
                <li class=" {{ $data->currentPage() == 1 ? ' disabled' : '' }} page-item"><a class="page-link"
                        href="{{ $data->url(1) }}">
                        <span aria-hidden="true">&laquo;</span>
                        <span class="sr-only">Previous</span>
                    </a>
                </li>
                @for ($i = 1; $i <= $data->lastPage(); $i++)
                    <li class="{{ $data->currentPage() == $i ? ' seleccionar ' : '' }} page-item">
                        <a class=" page-link " href="{{ $data->url($i) }}">{{ $i }}</a>
                    </li>
                @endfor
                <li class="{{ $data->currentPage() == $data->lastPage() ? ' disabled' : '' }} page-item">
                    <a href="{{ $data->url($data->currentPage() + 1) }}" class="page-link" aria-label="Next">
                        <span aria-hidden="true">&raquo;</span>
                        <span class="sr-only">Next</span>
                    </a>
                </li>
            </ul>
        </nav>
    </div>
@endsection
