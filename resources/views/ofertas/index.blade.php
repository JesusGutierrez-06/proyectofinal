@extends(Auth::user()->tipo_usuario_id == '1' ? 'admin.layout' : (Auth::user()->tipo_usuario_id == '2' ?
'estudiante.layout' : (Auth::user()->tipo_usuario_id == '3' ? 'empresa.layout' : 'layout')))
@section('title', 'Ofertas')

@section('contenido')

    <center>
        <h3>Lista de Ofertas laborales </h3>
    </center>
    <a class="btn btn-sm btn-danger" href="{{ route('reportes.ofertas') }}">PDF</a>
    <form class="form-inline d-flex justify-content-center md-form form-sm active-pink active-pink-2 mt-2">
        <i class="fa fa-search" aria-hidden="true"></i>
        <input class="form-control form-control-sm ml-3 w-75" name="buscar" value="{{ $buscar }}" type="text"
            placeholder="Buscar por Titulo, Empresas" aria-label="Search">
    </form>
    <br>
    <div class="card-columns">
        @foreach ($data as $oferta)
            <div class="card">
                <table style="text-align: center" class="table-responsive-xl">
                    <tbody>
                        <tr>
                            <td rowspan="4">
                                <img class="card-img-top" style="width: 8rem;"
                                    src="{{ Storage::url($oferta->logo)}}" alt="Card image cap">
                            </td>
                          <td scope="row"><a href="{{route('ofertas.show',$oferta->id)}}"> {{ $oferta->titulo }}</a> </td>
                        </tr>
                        <tr>
                            <td scope="row"><a href="{{route('empresa.show',$oferta->empresa_id)}}"> {{ $oferta->empresa }}</a> </td>
                        </tr>
                        <tr>
                            <td scope="row">{{ $oferta->departamento }} </td>
                        </tr>
                        <tr>
                            <td scope="row">{{ $oferta->vencimiento }} </td>
                        </tr>
                    </tbody>
                </table>
            </div>
        @endforeach
    </div>
@endsection
