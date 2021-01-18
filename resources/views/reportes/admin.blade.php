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


        @page {
            margin: 1cm 1cm;
            font-family: Arial;
        }

        body {
            margin: 4cm 2cm 2cm;
        }

        header {
            position: fixed;
            top: 0cm;
            left: 0cm;
            right: 0cm;
            height: 150px;
            text-align: center;
            line-height: 30px;
        }

        footer {
            position: fixed;
            bottom: 0cm;
            left: 0cm;
            right: 0cm;
            height: 2cm;
            text-align: center;
            line-height: 35px;
        }


    </style>
</head>

<body>

    <header>
        <div class="form-row">
            <div class="card-3">
                <img src="{{ public_path('static/assets/img/logos.png') }}" alt="Logo">
            </div>
            <div class="card-7 position">
                <h1>INSTITUTO TÉCNICO ENSEC "FELIPE LEONOR RIBERA"</h1>
                <h1> Calle La Paz Esq. Ñuflo de Chávez Nº159</h1>
            </div>
        </div>
    
    </header>
    
    <main>
   <center>
        <h1>Lista de Usuarios Registrados</h1>
    </center>

    <table class="bordered">
        <thead >
            <tr>
                <th scope="col">#</th>
                <th scope="col">Email</th>
                <th scope="col">Tipo Usuario</th>
                <th scope="col">Fecha de creación</th>
                <th scope="col">Estado</th>
            </tr>
        </thead>
        <tbody>
            <?php $contador =1; ?>
            @foreach ($data as $user)
                <tr>
                    <td >{{ $contador }} <?php $contador=$contador+1; ?></td>
                    <td>{{ $user->email }}</td>
                    <td>{{ $user->tipo_usuario }}</td>
                    <td>{{ $user->created_at }}</td>
                    <?php if ($user->estado == '1') {
                    echo '<td >Activo</td>';
                    } elseif ($user->estado == '0') {
                    echo '<td class="inactivo">Inactivo</td>';
                    
                } ?>
                </tr>
            @endforeach
        </tbody>
    </table>
</main>
    
<footer>
    <script type="text/php">
        if ( isset($pdf) ) {
            $pdf->page_script('
                $font = $fontMetrics->get_font("Arial, Helvetica, sans-serif", "normal");
                $pdf->text(680, 560, "Pagina $PAGE_NUM de $PAGE_COUNT", $font, 10);
            ');
        }
    </script>
</footer>

</body>
</html>