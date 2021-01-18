@extends(Auth::user()->tipo_usuario_id == '1' ? 'admin.layout' : (Auth::user()->tipo_usuario_id == '2' ?
'estudiante.layout' : (Auth::user()->tipo_usuario_id == '3' ? 'empresa.layout' : 'layout')))
@section('title', 'Registro Candidato')
@section('contenido')
    <center>
        <h3>
            Listado de mis ofertas postuladas
        </h3>
    </center>
    <br>
@if (Auth::user()->tipo_usuario_id == '2')
<table class="table table-responsive-xl">
    <thead class="table-color">
        <tr>
            <th>Titulo</th>
            <th>Empresa</th>
            <th>Departamento</th>
            <th>Vencimiento</th>
            <th>Celular</th>
            <th>Estado de selección</th>
            <th>Acciones</th>
        </tr>
    </thead>
    <tbody>
        @foreach ($data as $user)
            <tr>
                <th><a style="color: black;" href="{{route('ofertas.show',$user->id)}}">{{ $user->titulo }}</a></th>
                <td>{{ $user->empresa }}</td>
                <td>{{ $user->departamento }}</td>
                <td>{{ $user->fecha_postulacion }}</td>
                <td>{{ $user->celular }}</td>
                @if ($user->estado_preseleccion == '1')
                    <td class="badge" style="background-color: #00796b; color:white;">Seleccionado</td>
                @elseif($user->estado_preseleccion=='0')
                    <td class="badge badge-danger">Pendiente</td>
                @endif
                <td>
                    @if ($user->estado_preseleccion == '1')
                        <a href="{{ route('postular.contrato', $user->postular_oferta_id) }}">
                            <i title="Ver entrevista" style="color: black;" class="fa fa-eye"> </i></a>
                    @elseif($user->estado_preseleccion=='0')
                        <form action="{{ route('postular.destroy', $user->postular_oferta_id) }}" class="formulario" method="post">
                            @csrf @method('DELETE')
                            <button style="padding: 0; border: none; background: none;" onclick="confirmar();">
                                <i title="Cancelar Postulación" class="fas fa-trash-alt"></i> </button>
                        </form>
                    @endif
                </td>
            </tr>
        @endforeach
    </tbody>
</table>
@elseif(Auth::user()->tipo_usuario_id == '3')
<table class="table table-responsive-xl">
    <thead class="table-color">
        <tr>
            <th>Titulo</th>
            <th>Descripcion</th>
            <th>Publicado</th>
            <th>Vencimiento</th>
            <th>Salario</th>
            <th>Carrera</th>
            <th>Postulantes</th>
        </tr>
    </thead>
    <tbody>
        <?php $contador = 0?>
        @foreach ($data as $user)
            <tr>
                <th>{{ $user->titulo }}</th>
                <td style="width: 40%;">{{ $user->descripcion}}</td>
                <td style="width: 10%;">{{ $user->publicado }}</td>
                <td>{{ $user->vencimiento }}</td>
                <td  style="width: 10%;">{{ $user->salario}}</td>
                <td>{{ $user->carrera}}</td>
                <td><a href="{{ route('postular.show', $user->id) }}">
                    <img src="{{asset('/static/assets/img/Candidatos.png')}}"><br>
                    ({{ count($cantidad[$contador])}})
                    </a>
                    <?php $contador=$contador+1;?>
                </td>
            </tr>
        @endforeach
    </tbody>
</table>
@endif
    <script src="{{ asset('https://cdn.jsdelivr.net/npm/sweetalert2@10') }}"></script>

    @if (session('eliminar') == 'ok')
        <script>
            Swal.fire(
                '¡Eliminado',
                'La postulación ha sido eliminada.',
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
                    text: "Se eliminará la postulación sin vuelta atrás",
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
