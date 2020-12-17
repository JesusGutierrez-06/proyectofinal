<?php

namespace App\Http\Controllers;

use App\Models\Capacitacion;
use Illuminate\Http\Request;
use App\Models\Estudiante;
use Illuminate\Support\Facades\Auth;

class CapacitacionController extends Controller
{
    
    public function store(Request $request){
        // return $request->all();
        $estudiante= Estudiante::where('users_id','=',Auth::user()->id)->first();        
        $capacitacion = new Capacitacion();
        $capacitacion->estudiante_id = $estudiante->id;
        $capacitacion->tipo_capa_id = $request->tipo_capa_id;
        $capacitacion->area_capa_id = $request->area_capa_id;
        $capacitacion->nombre = $request->nombre;
        $capacitacion->institucion = $request->institucion;
        $capacitacion->fechainicio = $request->fechainicio;
        $capacitacion->fechafin = $request->fechafin;
        $capacitacion->estado=1;
// dd($estudiante);
        $capacitacion->save();
        return redirect()->route('estudios.index' );
    }
}
