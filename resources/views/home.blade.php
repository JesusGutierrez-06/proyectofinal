@extends( empty(Auth::user()) ? 'layout': (Auth::user()->tipo_usuario_id == '1' ? 'admin.layout' : (Auth::user()->tipo_usuario_id == '2' ?
'estudiante.layout' : (Auth::user()->tipo_usuario_id == '3' ? 'empresa.layout' : 'layout'))))
@section('title','Home')
    
@section('contenido')
<br>
<div id="slider-ins" class="carousel slide" data-ride="carousel">
  <!-- Indicadores -->
  <ol class="carousel-indicators">
    <li data-target="#slider-ins" data-slide-to="0" class="active"></li>
    <li data-target="#slider-ins" data-slide-to="1"></li>
    <li data-target="#slider-ins" data-slide-to="2"></li>
  </ol>

  <!-- Imagenes -->
  <div class="carousel-inner" role="listbox">
  
  <!-- Primera imagen -->
    <div class="item active">
      <img src="{{asset('/static/assets/gallery/fachada.jpg')}}" alt="Default">
      <div class="carousel-caption">
        Lorem ipsum dolor sit amet
      </div>
    </div>
  
  <!-- Segunda imagen -->
    <div class="item">
      <img src="{{asset('/static/assets/gallery/banner.png')}}" alt="Default">
      <div class="carousel-caption">
        Lorem ipsum dolor sit amet
      </div>
    </div>
  
  <!-- Tercera imagen -->
    <div class="item">
      <img src="{{asset('/static/assets/gallery/default.png')}}" alt="Default">
      <div class="carousel-caption">
        Lorem ipsum dolor sit amet
      </div>
    </div>
    
  </div>

  <!-- Controles -->
  <a class="left carousel-control" href="#slider-ins" role="button" data-slide="prev">
    <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
    <span class="sr-only">Previous</span>
  </a>
  <a class="right carousel-control" href="#slider-ins" role="button" data-slide="next">
    <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
    <span class="sr-only">Next</span>
  </a>
</div>
{{-- <section class="full-reset font-cover" style="background-image: url(assets/img/font-index.jpg);">
  <div class="full-reset" style="height: 100%; background-color: rgba(255,255,255,.6); padding: 60px 0;">
    <h1 class="text-center titles">Lorem ipsum dolor sit amet</h1>
    <figure class="Logo-Ins-Index">
      <img src="{{asset('/static/assets/img/logo.')}}" alt="Logo" class="img-responsive">
    </figure>
    <p class="lead text-center">
      "Lorem ipsum dolor sit amet, consectetur adipisicing elit. Alias repudiandae cumque dolorum mollitia tempora"
    </p>
  </div>
</section>
<div class="divider-general"></div> --}}

@endsection