@extends(Auth::user()->tipo_usuario_id == '1' ? 'admin.layout' : (Auth::user()->tipo_usuario_id == '2' ?
'estudiante.layout' : (Auth::user()->tipo_usuario_id == '3' ? 'empresa.layout' : 'layout')))
@section('title', 'Ofertas')

@section('contenido')
    <br>
    <div class="form-row">
        <div class="card col-md-4 mb-2">
            <div class="col-md-12 mb-2">
                <h3>Información de:<br>
                    {{ $data['empresa']->nombre }}
                </h3>
                <div class="card">
                    <center> <img class="card-img-top" style="width: 8rem;" src="{{ Storage::url($data['empresa']->logo) }}"
                            alt="Card image cap">
                    </center>
                </div>
                {{ $data['departamento']->nombre }} - Bolivia.<br>
                <strong>Telefono/Celular:</strong> {{ $data['oferta_laboral']->telefono }}
                @isset($data['oferta_laboral']->celular)
                    - {{ $data['oferta_laboral']->celular }}
                @endisset
                <br>
                <strong>Pagina Web:</strong>
                @isset($data['oferta_laboral']->url_pagina)
                    - {{ $data['oferta_laboral']->url_pagina }}
                @endisset
            </div>
        </div>
        <div class="card col-md-8 mb-2">
            <div class="card-header">
                <div class="form-row">
                    <div class="col-md-6 mb-2">
                        <strong> {{ $data['oferta_laboral']->titulo }}</strong>
                        <br><br>
                        <strong>ID Empleo:</strong> {{ $data['oferta_laboral']->id }}
                        <br>
                        <strong>ID Carrera:</strong> {{ $data['carrera']->id }}
                        <br>
                        <strong>Sueldo:</strong> {{ $data['salario']->nombre }}
                        <br>
                        <strong>Publicado:</strong> {{ $data['oferta_laboral']->publicado }}
                        <br>
                    </div>
                    <div class="col-md-6 mb-2">
                        @if (Auth::user()->tipo_usuario_id == '1')
                            {{-- <a href="{{ route('postular.show', $data['oferta_laboral']->id) }}"
                                class="btn btn-sm btn-default">Ver Lista de Postulantes</a> --}}
                                <br><br>
                        @elseif(Auth::user()->tipo_usuario_id == '2')
                                @if (count($data['postular_oferta'])<1)
                                <form action="{{ route('postular.store') }}" method="post">
                                    @csrf
                                    <label>Opcional</label>
                                    <input type="number" class="form-control" placeholder="Ingrese su aspiración salarial"
                                        name="aspiracion_salarial">
                                    <input type="hidden" value="{{ $data['oferta_laboral']->id }}" name="oferta_laboral_id">
                                    <input type="hidden" value="{{ $data['estudiante']->id }}" name="estudiante_id">
                                    <button type="submit" class="btn btn-sm btn-danger">Postular Oferta</button>
                                </form>
                                    @else
                                    <br><br>
                                @endif
                        @elseif(Auth::user()->tipo_usuario_id == '3')
                            @if ($data['usuarioempresa']->id == $data['oferta_laboral']->empresa_id)
                                <br>
                                <a href="{{ route('postular.show', $data['oferta_laboral']->id) }}"
                                    class="btn btn-sm btn-default">Ver Lista de Postulantes</a>
                                <br>
                            @else
                                <br>
                                <br>
                            @endif

                        @endif
                        <strong> Ubicación:</strong> {{ $data['departamento']->nombre }}
                        <br>
                        <strong> Carrera:</strong> {{ $data['carrera']->nombre }}
                        <br>
                        <strong> Contrato:</strong> {{ $data['contrato']->nombre }}
                        <br>
                        <strong> Vencimiento:</strong> {{ $data['oferta_laboral']->vencimiento }}
                    </div>
                </div>
            </div>
            <div class="card-body">
                <h4 class="card-title">Detalle del empleo</h4>
                <h5 class="card-text" style="text-align: center"><strong> {{ $data['oferta_laboral']->titulo }}</strong>
                </h5>
                <br>
                <strong>Objetivo del Cargo:</strong><br>
                <p><?php echo $requisitos = nl2br($data['oferta_laboral']->descripcion); ?>
                </p>
                <br>
                <strong>Requisitos:</strong><br>
                <p><?php echo $requisitos = nl2br($data['oferta_laboral']->requisito); ?>
                </p>
            </div>
        </div>
    </div>

@endsection
