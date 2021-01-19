@extends('admin.layout')
@section('title', 'Backup')
@section('contenido')
    <center>
        <h2>Copia de Seguridad</h2>
    </center>
    <h3>
        <a href="{{route('backups.create')}}" class="nav-link icon">
            <i class="fas fa-shield-alt"></i>
            Generar Copia de Seguridad
        </a>
        <?php if(!empty($mensaje)){
            echo 'La copia de seguridad se realizó correctamente. '.$mensaje;
        }?>
    </h3>
    <?php
$listar= null;
$contador=0;
$directorio = opendir('../public/storage/backups/E.N.S.E.C./') ;
while ($archivo = readdir($directorio))
								   {
                                    if($archivo != '.' && $archivo != '..' ){
                   if ($contador >=0) {
								   		$nombreArch = $archivo;
								   ?>
		             					<tr>
								   		<td>
								   			<a target="_blank" href="../public/storage/backups/E.N.S.E.C./<?=strtolower($nombreArch)?>">Copia de Seguridad.<?php echo $contador+1;?>.- <?=ucwords($nombreArch)?></a><br>
								   		</td>
										</tr>
								   		<?php
								   	}
								   $contador++;
								   }}
								closedir($directorio); 
								//echo "</table>\n";
								?>
    
<div class="card-header">

            <div class="form-row">
                <div class="card col-md-6 mb-2">
    
  </div>
    </div>
    </div>
    @endsection
