<!DOCTYPE html>
<html lang="es">

<head>
    <meta http-equiv=”Content-Type” content=”text/html; charset=UTF-8″ />
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>@yield('title')</title>

    <!-- Datepicker Files -->
    <link rel="stylesheet" href="{{ asset('datePicker/css/bootstrap-datepicker3.css') }}">
    <link rel="stylesheet" href="{{ asset('datePicker/css/bootstrap-standalone.css') }}">
    <!-- CSS -->
    <link rel="stylesheet" href="{{ asset('/static/css/font-awesome.min.css') }}">
    <link rel="stylesheet" href="{{ asset('/static/css/normalize.css') }}">
    <link rel="stylesheet" href="{{ asset('/static/css/bootstrap.min.css') }}">
    <link href="{{ asset('http://fonts.googleapis.com/css?family=PT+Sans+Narrow') }}" rel='stylesheet' type='text/css'>
    <link href="{{ asset('http://fonts.googleapis.com/css?family=Fjalla+One') }}" rel='stylesheet' type='text/css'>
    <link rel="stylesheet" href="{{ asset('/static/css/style.css') }}">
    <link rel="stylesheet" href="{{ asset('css/style.css') }}">
    <link rel="stylesheet" href="{{ asset('https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css') }}"
        integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">
    <!-- stilos diseñados -->
    <link rel="stylesheet"
        href="{{ asset('https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&display=fallback') }}">
    <!-- Font Awesome -->
    <link rel="stylesheet" href="{{ asset('plugins/fontawesome-free/css/all.min.css') }}">
    <!-- Ionicons -->
    <link rel="stylesheet" href="{{ asset('https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css') }}">
    <!-- Tempusdominus Bootstrap 4 -->
    <link rel="stylesheet"
        href="{{ asset('plugins/tempusdominus-bootstrap-4/css/tempusdominus-bootstrap-4.min.css') }}">
    <!-- iCheck -->
    <link rel="stylesheet" href="{{ asset('plugins/icheck-bootstrap/icheck-bootstrap.min.css') }}">
    <!-- JQVMap -->
    <link rel="stylesheet" href="{{ asset('plugins/jqvmap/jqvmap.min.css') }}">
    <!-- Theme style -->
    <link rel="stylesheet" href="{{ asset('dist/css/adminlte.min.css') }}">
    <!-- overlayScrollbars -->
    <link rel="stylesheet" href="{{ asset('plugins/overlayScrollbars/css/OverlayScrollbars.min.css') }}">
    <!-- Daterange picker -->
    <link rel="stylesheet" href="{{ asset('plugins/daterangepicker/daterangepicker.css') }}">
    <!-- summernote -->
    <link rel="stylesheet" href="{{ asset('plugins/summernote/summernote-bs4.min.css') }}">
</head>

<body>
    <!--======================================== Boton ir arriba ========================================-->
    <i class="btn-up fa fa-arrow-circle-o-up hidden-xs"></i>
    <!--======================================== Navegación ========================================-->
    <header class="full-reset header">
        <!--======================================== Logo(Nombre INS) ========================================-->
        <div class="full-reset logo">
            <span class="hidden-lg hidden-md">Instituto_E.N.S.E.C.<img src="{{ asset('/static/assets/img/logos.png') }}"
                    width="40px"></span>
            <span class="hidden-xs hidden-sm"><img src="{{ asset('/static/assets/img/logos.png') }}" width="40px">
                Instituto E.N.S.E.C.</span>
        </div>
        <!--======================================== Links de navegación ========================================-->
        <nav class="full-reset navigation">
            <ul class="full-reset list-unstyled">
                <li><a href="/">Inicio</a></li>
                <li><a href="/about">Institución</a></li>
                <li><a href="/admision">Admisión</a></li>
                <li><a href="#" class="btm-mega-menu">Más &nbsp;<i class="fa fa-caret-down"></i></a></li>
            </ul>
        </nav>
        <!--======================================== Mega menu ========================================-->
        <div class="full-reset mega-menu">
            <div class="container">
                <div class="row">
                    <div class="col-xs-12 col-sm-4">
                        <span class="full-reset titles">Recursos educativos</span>
                        <ul class="list-unstyled full-reset">
                            <li><a href="https://www.google.com/" class="open-link-newTab"><i
                                        class="fa fa-search"></i>&nbsp; Buscar en GOOGLE</a></li>
                            <li><a href="#!" class="open-link-newTab"><i class="fa fa-graduation-cap"></i>&nbsp;
                                    Plataforma (VIRTUAL)</a></li>
                        </ul>
                    </div>
                    <div class="col-xs-12 col-sm-4">
                        <span class="full-reset titles">Enlacesa importantes</span>
                        <ul class="list-unstyled full-reset">
                            <li><a href="{{ route('postular.index') }}"><i class="fa fa-folder-open"></i>&nbsp; Ofertas
                                    Postuladas</a></li>
                            <li><a href="{{ route('ofertas.index') }}"><i class="fa fa-list-alt"></i>&nbsp; Mis Ofertas
                                    laborales</a></li>
                            <li><a href="{{ route('ofertas.create') }}"><i class="fa fa-newspaper-o"></i>&nbsp; Publicar
                                    nueva oferta laboral</a></li>
                            <li><a href="{{ route('empresa.edit', ':' . Auth::user()->id) }}"><i
                                        class="fa fa-file"></i>&nbsp; Editar datos de la Empresa</a></li>
                            {{-- <li><a href="#!" class="open-link-newTab"><i
                                        class="fa fa-users"></i>&nbsp; Gestionar Usuarios</a></li>
                            --}}
                        </ul>
                    </div>
                    <div class="col-xs-12 col-sm-4">
                        <span class="full-reset titles">Sesión</span>
                        <ul class="list-unstyled full-reset">
                            <li>
                                <form method="POST" action="{{ route('logout') }}">
                                    @csrf
<<<<<<< HEAD
                                    <x-jet-responsive-nav-link class="nav-link" href="{{ route('logout') }}" onclick="event.preventDefault();
               this.closest('form').submit();">
                                    <i  class="fa fa-power-off"></i>{{ __('Desconectar') }}
=======
                                    <i class="fa fa-users"></i>&nbsp;
                                    <x-jet-responsive-nav-link href="{{ route('logout') }}" onclick="event.preventDefault();
               this.closest('form').submit();">
                                        {{ __('Desconectar') }}
>>>>>>> a0fafc9f8242f00d39a4ebffc22d8efb2b11d03b
                                    </x-jet-responsive-nav-link>
                                </form>

                            </li>
                            {{-- <li><a href="/empresa_login"><i
                                        class="fa fa-file"></i>&nbsp; Datos de Usuario</a></li>
                            <li><a href="/empresa_usuario"><i class="fa fa-edit"></i>&nbsp;Modificar datos de
                                    Usuario</a></li> --}}
<<<<<<< HEAD
                            {{-- <li>
=======
                            <li>
>>>>>>> a0fafc9f8242f00d39a4ebffc22d8efb2b11d03b
                                <form action="{{ route('admin.destroy', Auth::user()->id) }}" class="formulario"
                                    method="post">
                                    @csrf @method('DELETE')
                                    <input type="hidden" name="estado" value="0">
                                    <button class="btn-delete" onclick="confirmarbaja();"><i
                                            class="fa fa-user-times"></i>&nbsp; Dar de baja mi cuenta
                                    </button>
                                </form>
<<<<<<< HEAD
                            </li> --}}
=======
                            </li>
>>>>>>> a0fafc9f8242f00d39a4ebffc22d8efb2b11d03b
                        </ul>
                    </div>
                </div>
            </div>
            <i class="fa fa-times-circle btm-mega-menu close-mega-menu fa-2x"></i>
        </div>
        <!--======================================== Boton menu mobil ========================================-->
        <a href="#" class=" hidden-sm hidden-md hidden-lg pull-right button-menu-mobile show-close-menu-m"><i
                class="fa fa-ellipsis-v"></i></a>
    </header>
    <!--======================================== Logo & Lema ========================================-->
    <div class="container">
        @yield('contenido')
    </div>
    <!--======================================== Enlaces importantes ========================================-->
    <section class="text-center important-links-index">
        <h2 class="titles">Sitios y enlaces importantes</h2>

        <a href="#!" class="open-link-newTab">
            <i class="fa fa-graduation-cap"></i>
            <p>Clases Online</p>
        </a>

        <a href="#!" class="open-link-newTab">
            <i class="fa fa-book"></i>
            <p>Libreria</p>
        </a>
        {{-- <a href="#!" class="open-link-newTab">
            <i class="fa fa-globe"></i>
            <p>JOVENES A.T.T</p>
        </a> --}}
        <a href="#!" class="open-link-newTab">
            <i class="fa fa-star-o"></i>
            <p>Promo. INS</p>
        </a>
        <a href="#!" class="open-link-newTab">
            <i class="fa fa-file-text-o"></i>
            <p>Cons.conducta</p>
        </a>
        <a href="#!" class="open-link-newTab">
            <i class="fa fa-download"></i>
            <p>Descargas</p>
        </a>
    </section>
    <!--======================================== Pie de pagina ========================================-->
    <footer class="full-reset footer">
        <div class="full-reset" style="padding: 15px 0;">
            <div class="container">
                <div class="row">
                    <div class="col-xs-12 col-sm-4">
                        <h4 class="titles text-center">Visitenos en</h4>
                        <p class="text-center">Z/ Central, Calle La Paz 158 esq. Nuflo de Chavez.</p>
                    </div>
                    <div class="col-xs-12 col-sm-4">
                        <h4 class="titles text-center">Contactenos</h4>
                        <p class="text-center">Tel: 3332859<br>Correo Electrónico: ensec@ensec.edu.bo</p>
                    </div>
                    <div class="col-xs-12 col-sm-4">
                        <h4 class="titles subtitles-footer">Siguenos en</h4>
                        <ul class="list-unstyled links-footer">
                            <li><a href="https://www.facebook.com/ensec.edu/" class="open-link-newTab"><i
                                        class="fa fa-facebook"></i> &nbsp; Facebook</a></li>
                            <li><a href="#!" class="open-link-newTab"><i class="fa fa-twitter"></i> &nbsp; Twitter</a>
                            </li>
                            <li><a href="#!" class="open-link-newTab"><i class="fa fa-google-plus"></i> &nbsp;
                                    Google+</a></li>
                        </ul>
                    </div>
                    <div class="col-xs-12">
                        <div class="full-reset footer-copyright"><i class="fa fa-copyright"></i> 2020 Jesus Gutierrez
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </footer>

    {{-- menu --}}
    <script src="{{ asset('//ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js') }}"></script>

    <!-- Languaje -->
    <script src="{{ asset('datePicker/js/bootstrap-datepicker.js') }}"></script>
    <script src="{{ asset('/static/js/modernizr.js') }}"></script>
    <script src="{{ asset('/static/js/bootstrap.min.js') }}"></script>
    <script src="{{ asset('/static/js/main.js') }}"></script>
    <script src="{{ asset('datePicker/locales/bootstrap-datepicker.es.min.js') }}"></script>
    <script>
        window.jQuery || document.write('<script src="{{ asset('
            js / jquery - 1.11 .2.min.js ') }}"><\/script>')
    </script>
    <!-- jQuery and JS bundle w/ Popper.js -->
    <script src="{{ asset('https://code.jquery.com/jquery-3.5.1.slim.min.js') }}"
        integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous">
    </script>
    <script src="{{ asset('https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js') }}"
        integrity="sha384-ho+j7jyWK8fNQe+A12Hb8AhRq26LrZ/JpcUGGOn+Y7RsweNrtN/tE3MoK7ZeZDyx" crossorigin="anonymous">
    </script>
    <!-- Jquery -->
    <script src="{{ asset('https://cdn.jsdelivr.net/npm/sweetalert2@10') }}"></script>
    {{-- @if (session('eliminar') == 'ok')
        <script>
            Swal.fire(
                '¡Eliminado!',
                'El registro se ha eliminado.',
                'success'
            )

        </script>
    @endif --}}
    <script>
        function confirmarbaja() {
            $('.formulario').submit(function(e) {
                e.preventDefault();
                Swal.fire({
                    title: '¿Está seguro(a)?',
                    text: "El registro se eliminará",
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
</body>
</html>
