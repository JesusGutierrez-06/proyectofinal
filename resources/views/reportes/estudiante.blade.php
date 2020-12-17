<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <title>Document</title>
    <style>
        body {
            font-size: 9px;
            /* #221F1F; */
        }

        table {
            border-spacing: 0;
            width: 100%;
        }

        .bordered {
            border: solid #221F1F 1px;
            -moz-border-radius: 20px;
            -webkit-border-radius: 20px;
            border-radius: 20px;
            -webkit-box-shadow: 0 3px 3px #221F1F;
            -moz-box-shadow: 0 3px 3px #221F1F;
            box-shadow: 0 3px 3px #221F1F;
        }

        .bordered td,
        .bordered th {
            border-left: 1px solid #ccc;
            border-top: 1px solid #221F1F;
            padding: 10px;
            text-align: left;
        }

        .bordered th {
            background-color: #221F1F;
            color: #ccc;
            border-top: none;
        }

        .bordered td:first-child,
        .bordered th:first-child {
            border-left: none;
        }

        .bordered th:first-child {
            -moz-border-radius: 20px 0 0 0;
            -webkit-border-radius: 20px 0 0 0;
            border-radius: 20px 0 0 0;
        }

        .bordered th:last-child {
            -moz-border-radius: 0 20px 0 0;
            -webkit-border-radius: 0 20px 0 0;
            border-radius: 0 20px 0 0;
        }

        .bordered tr:last-child td:first-child {
            -moz-border-radius: 0 0 0 20px;
            -webkit-border-radius: 0 0 0 20px;
            border-radius: 0 0 0 20px;
        }

        .bordered tr:last-child td:last-child {
            -moz-border-radius: 0 0 20px 0;
            -webkit-border-radius: 0 0 20px 0;
            border-radius: 0 0 20px 0;
        }

        .inactivo {
            background-color: #B2AAA9;
            color: #E8DEDE;
        }

        .form-row {
            /*for demo only*/
            width 100%;
            height: 100px;
            padding: 20px;
        }

        .card-3 {
            width: 20%;
            float: left;
            margin-left: 10px;
        }

        .card-7 {
            width: 80%;
            float: left;
            margin-left: 10px;
        }

        .position {
            text-align: center;
        }

    </style>
</head>

<body>

    <div class="form-row">
        <div class="card-3">
            <img src="{{ public_path('static/assets/img/logos.png') }}" alt="Logo">
        </div>
        <div class="card-7 position">
            <h1>INSTITUTO TÉCNICO ENSEC "FELIPE LEONOR RIBERA"</h1>
            <h1> Calle La Paz Esq. Ñuflo de Chávez Nº159</h1>
        </div>
    </div>
    <br>
    <center>
        <h1>Lista de Estudiantes Registrados</h1>
    </center>

    <table class="bordered">
        <thead>
            <tr>
                <th>#</th>
                <th>Nombre</th>
                <th>Matricula</th>
                <th>Celular / Telefono</th>
                <th>DNI</th>
                <th>Lugar Nac.</th>
                <th>Direccion</th>
                <th>Fecha de Nac.</th>
                <th>Estado</th>
                <th>Fecha de creación</th>
            </tr>
        </thead>
        <tbody>
            <?php $contador =1; ?>
            @foreach ($data as $user)
                <tr>
                    <td >{{ $contador }} <?php $contador=$contador+1; ?></td>
                    <td>{{ $user->nombre }} {{ $user->apellidop }} {{ $user->apellidom }}</td>
                    <td>{{ $user->matricula }}</td>
                    <td>{{ $user->celular }} / {{ $user->telefono }}</td>
                    <td>{{ $user->dni }}</td>
                    <td>{{ $user->departamento }} - {{ $user->provincia }}</td>
                    <td>{{ $user->direccion }}</td>
                    <td>{{ $user->fechanac }}</td>
                    <td>{{ $user->created_at }}</td>
                    <?php if ($user->estado == '1') {
                    echo '<td>Activo</td>';
                    } elseif ($user->estado == '0') {
                    echo '<td class="inactivo">Inactivo</td>';
                    } ?>
                </tr>
            @endforeach
        </tbody>
    </table>
</body>

</html>
