@extends('admin.layout')
@section('title', 'Home')
@section('contenido')
    <center>
        <h2>Lista de Usuarios Registrados</h2>
    </center>
    <a class="btn btn-sm btn-danger" href="{{ route('reportes.admin') }}">PDF</a>
    <ul class="navbar-nav ml-auto float-right">
        <li class="nav-item">
            <a class="nav-link icon"  href="{{ route('admin.create') }}" role="button">
                <i class="fas fa-user-plus"></i>Nuevo Usuario
            </a>
            <div class="navbar-search-block">
                <form class="form-inline">
                    <div class="input-group input-group-sm ">
                        <input name="buscar" class="form-control form-control-navbar" type="search" placeholder="Buscar por E-mail"
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
                <th scope="col">Email</th>
                <th scope="col">Tipo Usuario</th>
                <th scope="col">Estado</th>
                <th scope="col">Fecha de creación</th>
                <th scope="col">Acciones</th>
            </tr>
        </thead>
        <tbody>
            @foreach ($data as $user)
                <tr>
                    <th scope="row">{{ $user->id }}</th>
                    <td>{{ $user->email }}</td>
                    <td>{{ $user->tipo_usuario }}</td>
                    <?php if ($user->estado == '1') {
                    echo '<td class="badge" style="background-color: #00796b; color:white;">Activo</td>';
                    } elseif ($user->estado == '0') {
                    echo '<td class="badge badge-danger">Inactivo</td>';
                    } ?>
                    <td>{{ $user->created_at }}</td>
                    <td>
                        <form action="{{ route('admin.destroy', $user->id) }}" class="formulario" method="post">
                            @csrf @method('DELETE')
                            <a href="{{ route('admin.show', $user->id) }}"><i title="Ver más" 
                                    class="fa fa-eye icon"> </i></a>
                            <a href="{{ route('admin.edit', $user->id) }}"><i title="Editar"
                                    class="fa fa-edit icon" ></i></a>
                                    @if ($user->estado == '0')
                                    <input type="hidden" name="estado" value="1">
                                    <button class="btn-delete" onclick="confirmar();"><i title="Restaurar"
                                            class="fas fa-bullseye"></i> </button>
                                @else
                                    <input type="hidden" name="estado" value="0">
                                    <button class="btn-delete" onclick="confirmar();"><i title="Eliminar"
                                            class="fas fa-trash-alt"></i> </button>
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
        </ul>
        </li>
    </nav>
    <script src="{{ asset('https://cdn.jsdelivr.net/npm/sweetalert2@10') }}"></script>

    @if (session('eliminar') == 'ok')
        <script>
            Swal.fire(
                '¡Dado de baja!',
                'El usuario ha sido dado de baja.',
                'success'
            )

        </script>
    @endif
    <script>
        function confirmar() {
            $('.formulario').submit(function(e) {
                e.preventDefault();
                Swal.fire({
                    title: '¿Está seguro(a)?',
                    text: "El usuario pasará a estar de baja",
                    icon: 'warning',
                    showCancelButton: true,
                    confirmButtonColor: '#00796b',
                    cancelButtonColor: '#d33',
                    confirmButtonText: '¡Sí, Bórralo!',
                    cancelButtonText: 'Cancelar',
                }).then((result) => {
                    if (result.isConfirmed) {

                        this.submit();
                    }

                })

            })
        }

    </script>

@endsection
