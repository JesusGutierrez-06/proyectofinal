<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

use Barryvdh\DomPDF\Facade;
use App\Models\Estudiante;
use App\Models\Departamento;
use App\Models\Provincia;
use App\Models\EstadoCivil;
use App\Models\TipoSangre;
use App\Models\Genero;
use App\Models\Admin;
use App\Models\AreaCapa;
use App\Models\Carrera;
use App\Models\Estudios;
use App\Models\TipoCapa;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Auth;

class EstudiosController extends Controller
{
    public function index(Request $request){
        $estudiante= Estudiante::where('users_id','=',Auth::user()->id)->first();
        $buscar= $request->get('buscar');
        $data['estudios']= DB::table('estudios')
        ->join('carrera','carrera.id','=','estudios.carrera_id')
        ->select('estudios.*','carrera.nombre as carrera')
        ->where('estudios.institucion','like','%'.$buscar.'%')
        ->where('estudios.estudiante_id','=',$estudiante->id)
        ->orderBy('estudios.id','asc')
        ->get();    
        $data['capacitacion']= DB::table('capacitacion')
        ->join('tipo_capa','tipo_capa.id','=','capacitacion.tipo_capa_id')
        ->join('area_capa','area_capa.id','=','capacitacion.area_capa_id')
        ->select('capacitacion.*','tipo_capa.nombre as tipo_capa',
        'area_capa.nombre as area_capa')
        ->where('capacitacion.institucion','like','%'.$buscar.'%')
        ->where('capacitacion.estudiante_id','=',$estudiante->id)
        ->orderBy('capacitacion.id','asc')
        ->get();
        $data['carrera']= Carrera::all();
        $data['tipo_capa'] = TipoCapa::all();
        $data['area_capa'] = AreaCapa::all();
        // return dd($data);
        // $data = Admin::All();
        // dd($data['capacitacion']);        
        return view('estudios.index', compact('data','buscar'));
        // return view('estudiante.index');
    }
    public function create(){

    }
    public function store(Request $request){
        // return $request->all();
        $estudiante= Estudiante::where('users_id','=',Auth::user()->id)->first();        
        $estudios = new Estudios();
        $estudios->estudiante_id = $estudiante->id;
        $estudios->carrera_id = $request->carrera_id;
        $estudios->semestre = $request->semestre;
        $estudios->institucion = $request->institucion;
        $estudios->fechainicio = $request->fechainicio;
        $estudios->fechafin = $request->fechafin;
        $estudios->estado=1;
// dd($estudiante);
        $estudios->save();
        return redirect()->route('estudios.index' );
    }
    public function show(Estudiante $estudiante){

    }

    public function edit(Estudiante $estudiante){
    
    }
    public function update(Request $request, Estudiante $estudiante){
    
    }
    public function destroy( Estudiante $estudiante){

        $estudiante->estado =0;
        // dd($empresa);
        $estudiante->save();
        return redirect()->route('estudiante.index');
    }
    public function imprimir(){
    
    }

}
