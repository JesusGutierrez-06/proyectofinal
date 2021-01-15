<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<!-- HTML Resume Template from http://www.alexking.org/software/resume/ -->
<html>

<head>
    <title> Curriculum Vitae </title>
    <meta http-equiv="content-type" content="text/html; charset=utf-8" />
    <style type="text/css" media="screen">
        body {
            margin: 10px;
        }

        p,
        td,
        span,
        li,
        a {
            font-family: verdana, arial, helvetica, sans-serif;
        }

        h1 {
            font: 90% verdana, arial, helvetica, sans-serif;
            font-weight: bold;
            margin: 0 0 5px 0;
        }

        h2 {
            border-bottom: 1px solid #666;
            clear: both;
            font: 80% verdana, arial, helvetica, sans-serif;
            font-weight: bold;
            margin: 15px 0 10px 0;
            padding: 0 0 3px 0;
            width: 700px;
        }

        h3 {
            float: left;
            font: 80% verdana, arial, helvetica, sans-serif;
            font-weight: bold;
            margin: 0 0 5px 0;
            padding: 0;
            width: 446px;
        }

        li {
            font-size: 70%;
            margin: 0 0 3px 20px;
            padding: 0;
        }

        p {
            font-size: 70%;
            margin: 0 0 10px 0;
            padding: 0;
            width: 575px;
        }

        body ul {
            margin: 0 0 0 125px;
            padding: 0;
            width: 575px;
        }

        body div ul {
            margin: 3px 0 0 0;
            padding: 0;
            width: 575px;
        }

        #bio_left {
            font-size: 75%;
            float: left;
            width: 350px;
        }

        .bio_right {
            font-size: 75%;
            float: left;
            text-align: right;
            width: 350px;
        }

        .company {
            clear: both;
            margin: 0 0 5px 0;
            padding: 0;
        }

        .data {
            padding-left: 125px;
        }

        .date {
            clear: left;
            float: left;
            padding-top: 2px;
            width: 125px;
        }

        .job {
            clear: both;
            width: 700px;
        }

        .job_data {
            float: left;
            width: 575px;
        }

        .location {
            clear: right;
            float: left;
            text-align: right;
            width: 125px;
        }

        .position {
            font-style: italic;
            margin: 0 0 5px 0;
        }

        #references {
            margin-top: 20px;
        }

        #meta {
            margin-top: 30px;
        }

        .card-3 {
            width: 20%;
            float: left;
            margin-left: 10px;
        }

    </style>
</head>

<body>
    <div class="card-3">
        <img style="width: 8rem;" src="{{ public_path('/storage' . substr($data['estudiante']->foto, 6)) }}">
    </div>
    <div class="card-3" style="float: right;">
        <img src="{{ public_path('static/assets/img/logos.png') }}" alt="Logo">
    </div>
    <br>
    <h1>{{ $data['estudiante']->nombre }} {{ $data['estudiante']->apellidop }} {{ $data['estudiante']->apellidom }}</h1>
    <p id="bio_left">
        Cel.:{{ $data['estudiante']->celular }}
        <br />
        Email:{{ $data['users']->email }}
        <br />
        Edad: {{-- Para habilidades --}}
    <h2>HABILIDADES, TECNOLOGÍAS &amp; PROJECTOS</h2>
    @foreach ($data['estudios_idioma'] as $estudios)
        <ul>
            {{ $estudios->idioma }}
            <li>Hablar : {{ $estudios->hablar }} </li>
            <li>Escribir: {{ $estudios->escribir }} </li>
            <li>Leer : {{ $estudios->leer }} </li>
        </ul>
    @endforeach
    {{-- La carta de Presentación --}}
    {{-- <h2>OBJECTIVE</h2>
    <p class="data"> Carta de Presentación </p> --}}
    <h2>ESTUDIOS</h2>
    @foreach ($data['estudios'] as $estudios)
        <div class="job">
            <p class="date">
                {{--
            <p class="bio_right"> Ciudad </p> --}}
            <p class="company">{{ $estudios->institucion }}</p>
        </div>
        </div>
    @endforeach
    <h2>Cursos / Capacitaciones</h2>
    @foreach ($data['capacitacion'] as $estudios)
        <div class="job">
            <p class="date">
                {{--
            <p class="bio_right"> Ciudad </p> --}}
            <p class="company">{{ $estudios->institucion }}</p>
        </div>
        </div>
    @endforeach
    <h2>EXPERIENCE</h2>
    @foreach ($data['exp_laboral'] as $estudios)
        <div class="job">
            <p class="date">{{ substr($estudios->fechainicial, 0, 7) }} - {{ substr($estudios->fechafin, 0, 7) }}</p>
            <div class="job_data">
                <h3>{{ $estudios->institucion }} </h3>
                {{-- <p class="location"> Ciudad </p>
                else
                <p class="location">&nbsp;</p> --}}
                <p class="company"> </p>
                {{-- Foreach --}}
                <p class="position"> {{ $estudios->puesto }}</p>
                <ul>
                    <li> {{ $estudios->descripcion }}</li>
                </ul>
                &nbsp;
            </div>
        </div>
    @endforeach
    <p id="references"></p>
    <p id="meta">
    </p>
</body>
</html>