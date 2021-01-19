<?php

namespace App\Http\Controllers;

use Carbon\Carbon;
use Illuminate\Http\Request;

class BackupController extends Controller
{
    //
    public function index()
    {
        // $listar= null;
        //     $directorio = opendir('../public/storage/backups/E.N.S.E.C./') ;
        //     $contador =0;
        //     while ($archivo = readdir($directorio))
        //        {
        //         if($archivo != '.' && $archivo != '..' ){
        //            if ($contador >=0) {
        //                $nombreArch[] = $archivo;
        //            }
        //        $contador++;
        //        }
        //     }    closedir($directorio); 
            //echo "</table>\n";
        //  dd($nombreArch);
        // $mensaje='';
        return view('backups.index');
    }
    public function create()
    {
        $dump = "cd ../ && php artisan backup:run --only-db";
        $mensaje = system($dump, $output);

        return view('backups.index',compact('mensaje'));
    }
    
}
