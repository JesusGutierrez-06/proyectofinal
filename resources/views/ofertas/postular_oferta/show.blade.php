@extends(Auth::user()->tipo_usuario_id == '1' ? 'admin.layout' : (Auth::user()->tipo_usuario_id == '3' ?
'empresa.layout' : 'layout'))
@section('title', 'Registro Candidato')
@section('contenido')
@if (!$data->isEmpty())
<center>
    <h3>
        Listado de postulante a la ofertal laboral
        <br>
        <strong>
            {{ $data[0]->titulo }}
        </strong>
    </h3>
</center>
<table style="text-align: center" class="table table-responsive-xl">
    <thead class="table-color">
        <tr>
            <th scope="col">#</th>
            <th scope="col">Nombre</th>
            <th scope="col">Apellido Paterno</th>
            <th scope="col">Apellido Materno</th>
            <th scope="col">Telefono</th>
            <th scope="col">Celular</th>
            <th scope="col">Fecha de postulación</th>
            <th scope="col">Acciones</th>
        </tr>
    </thead>
    <tbody>
        @foreach ($data as $user)
            <tr>
                <th scope="row">{{ $user->id }}</th>
                <td>{{ $user->nombre }}</td>
                <td>{{ $user->apellidop }}</td>
                <td>{{ $user->apellidom }}</td>
                <td>{{ $user->telefono }}</td>
                <td>{{ $user->celular }}</td>
                <td>{{ $user->created_at }}</td>
                <td>
                    <a  class="open-link-newTab" href="{{route('reportes.curriculum',$user->estudiante_id)}}"><i title="Ver Curriculum" class="icon fas fa-file"></i></a>
                    <form action="{{ route('postular.update', $user->id) }}"class="formulario"  method="post">
                    @csrf @method('PUT')
                    <input type="hidden" name="oferta_laboral_id" value="{{ $user->oferta_laboral_id }}">
                    <?php if ($user->estado_preseleccion == '0') {
                    echo '<input type="hidden" name="preseleccion" value="1">';
                    echo '<button onclick="confirmar();" class="btn btn-sm btn-danger"
                            style="background-color: #00796b; color:white;">Seleccionar</button>';
                    } elseif ($user->estado_preseleccion == '1') {
                    echo '<input type="hidden" name="preseleccion" value="0">';
                    echo ' <button  class="btn btn-sm btn-danger">Deseleccionar</button>';
                    } ?>
                </form>
            </td>
            </tr>
        @endforeach
    </tbody>
</table>

@else
<center>
    <h1>Actualmente no tiene postulantes la oferta laboral</h1>
</center>
    @endif
    <script src="{{ asset('https://cdn.jsdelivr.net/npm/sweetalert2@10') }}"></script>

    @if (session('eliminar') == 'ok')
        <script>
            Swal.fire(
                '¡Seleccionado!',
                'El postulante ha sido seleccionado.',
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
                    text: "Se seleccionará al candidato",
                    icon: 'warning',
                    showCancelButton: true,
                    confirmButtonColor: '#00796b',
                    cancelButtonColor: '#d33',
                    confirmButtonText: '¡Sí, Seleccionar!',
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
