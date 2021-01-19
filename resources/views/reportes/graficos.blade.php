@extends(Auth::user()->tipo_usuario_id == '1' ? 'admin.layout' : (Auth::user()->tipo_usuario_id == '2' ?
'estudiante.layout' : (Auth::user()->tipo_usuario_id == '3' ? 'empresa.layout' : 'layout')))
<<<<<<< HEAD
@section('title', 'Gráficos')

@section('contenido')
    <div class="card-header">

        <div class="form-row">
            <div class="card col-md-6 mb-2">

                <center>
                    <h3>Cantidad de Usuarios activos </h3>
                </center>
                <canvas id="usuarios" width="400" height="400"></canvas>
            </div>

            <div class="card col-md-6 mb-2">
                <center>
                    <h3>Los 10 mejores empleadores</h3>
                </center>
                <canvas id="ofertas" width="400" height="400"></canvas>

            </div>
        </div>
    </div>
    <script src="https://cdn.jsdelivr.net/npm/chart.js@2.9.4/dist/Chart.min.js"></script>
    <script>
        var ctx = document.getElementById('usuarios').getContext('2d');
        var usuarios = new Chart(ctx, {
            type: 'bar',
            data: {
                labels: [
                    <?php
                    if (count($data['empresas']) > count($data['estudiantes'])) {
                        echo "'Empresas','Estudiantes'";
                    } else {
                        echo "'Estudiante','Empresa'";
                    } ?>
                ],
                datasets: [{
                    label: 'Número de usuarios',
                    data: [ <?php echo count($data['empresas']).
                        ','.count($data['estudiantes']); ?>
                    ],
                    backgroundColor: [
                        'rgba(255, 99, 132, 0.2)',
                        'rgba(54, 162, 235, 0.2)',
                        'rgba(255, 206, 86, 0.2)',
                        'rgba(75, 192, 192, 0.2)',
                        'rgba(153, 102, 255, 0.2)',
                        'rgba(255, 159, 64, 0.2)'
                    ],
                    borderColor: [
                        'rgba(255, 99, 132, 1)',
                        'rgba(54, 162, 235, 1)',
                        'rgba(255, 206, 86, 1)',
                        'rgba(75, 192, 192, 1)',
                        'rgba(153, 102, 255, 1)',
                        'rgba(255, 159, 64, 1)'
                    ],
                    borderWidth: 1
                }]
            },
            options: {
                scales: {
                    yAxes: [{
                        ticks: {
                            beginAtZero: true
                        }
                    }]
                }
            }
        });

        var ctx = document.getElementById('ofertas').getContext('2d');
        var ofertas = new Chart(ctx, {
            type: 'bar',
            data: {
                labels: [
                    <?php
                    for ($i = 0; $i < count($cantidades); $i++) {
                        echo "'".$cantidades[$i][0] -> empresa.
                        "',";
                    } ?>
                ],
                datasets: [{
                    label: 'Ofertas Publicadas',
                    data: [
                        <?php
                        if (count($cantidades) <= 10) {
                            for ($i = 0; $i < count($cantidades); $i++) {
                                $contador = count($cantidades[$i]);
                                echo $contador.
                                ',';
                            }
                        } else {
                            for ($i = 0; $i < 10; $i++) {
                                $contador = count($cantidades[$i]);
                                echo $contador.
                                ',';
                            }
                        } ?>
                    ],
                    backgroundColor: [
                        'rgba(255, 99, 132, 0.2)',
                        'rgba(54, 162, 235, 0.2)',
                        'rgba(255, 206, 86, 0.2)',
                        'rgba(75, 192, 192, 0.2)',
                        'rgba(153, 102, 255, 0.2)',
                        'rgba(255, 159, 64, 0.2)'
                    ],
                    borderColor: [
                        'rgba(255, 99, 132, 1)',
                        'rgba(54, 162, 235, 1)',
                        'rgba(255, 206, 86, 1)',
                        'rgba(75, 192, 192, 1)',
                        'rgba(153, 102, 255, 1)',
                        'rgba(255, 159, 64, 1)'
                    ],
                    borderWidth: 1
                }]
            },
            options: {
                scales: {
                    yAxes: [{
                        ticks: {
                            beginAtZero: true
                        }
                    }]
                }
            }
        });

=======
@section('title', 'Ofertas')

@section('contenido')

    <center>
        <h3>Gráficos de las 10 empresas más empleadores </h3>
    </center>
    <div class="row col-6">
    <canvas id="myChart" width="400" height="400"></canvas>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/chart.js@2.9.4/dist/Chart.min.js"></script>

<script>
    var empresas=[];
    var valores=[];

    var ctx = document.getElementById('myChart').getContext('2d');
    var myChart = new Chart(ctx, {
        type: 'bar',
        data: {
            labels: {{ $data[0]->id }},
            datasets: [{
                label: '# de empresas',
                data:valores,
                backgroundColor: [
                    'rgba(255, 99, 132, 0.2)',
                    'rgba(54, 162, 235, 0.2)',
                    'rgba(255, 206, 86, 0.2)',
                    'rgba(75, 192, 192, 0.2)',
                    'rgba(153, 102, 255, 0.2)',
                    'rgba(255, 159, 64, 0.2)'
                ],
                borderColor: [
                    'rgba(255, 99, 132, 1)',
                    'rgba(54, 162, 235, 1)',
                    'rgba(255, 206, 86, 1)',
                    'rgba(75, 192, 192, 1)',
                    'rgba(153, 102, 255, 1)',
                    'rgba(255, 159, 64, 1)'
                ],
                borderWidth: 1
            }]
        },
        options: {
            scales: {
                yAxes: [{
                    ticks: {
                        beginAtZero: true
                    }
                }]
            }
        }
    });
>>>>>>> a0fafc9f8242f00d39a4ebffc22d8efb2b11d03b
    </script>
@endsection
