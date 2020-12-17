<?php

namespace App\Http\Controllers;

use App\Models\AreaLaboral;
use Illuminate\Http\Request;
use App\Models\Estudiante;
use App\Models\ExpLaboral;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Auth;
use App\Models\Idioma;

class ExpLaboralController extends Controller
{
    //
    public function index(Request $request){
        $estudiante= Estudiante::where('users_id','=',Auth::user()->id)->first();
        $buscar= $request->get('buscar');
        $data['exp_laboral']= DB::table('exp_laboral')
        ->join('area_laboral','area_laboral.id','=','exp_laboral.area_laboral_id')
        ->select('exp_laboral.*','area_laboral.nombre as area_laboral')
        ->where('exp_laboral.institucion','like','%'.$buscar.'%')
        ->where('exp_laboral.estudiante_id','=',$estudiante->id)
        ->orderBy('exp_laboral.id','asc')
        ->paginate(5);    
        // return dd($data);
        // $data = Admin::All();
        $data['estudios_idioma']= DB::table('estudios_idioma')
        ->join('idioma','idioma.id','=','estudios_idioma.idioma_id')
        ->select('estudios_idioma.*','idioma.nombre as idioma')
        ->where('estudios_idioma.estudiante_id','=',$estudiante->id)
        ->orderBy('estudios_idioma.id','asc')
        ->paginate(5);    
        
        $data['area_laboral']= AreaLaboral::all();
        $data['idioma']= Idioma::All();
        // dd($data);
        return view('exp_laboral.index', compact('data','buscar'));
        // return view('estudiante.index');
    }
    public function create(){

    }
    public function store(Request $request){
        // return $request->all();
        $estudiante= Estudiante::where('users_id','=',Auth::user()->id)->first();
        $explaboral = new ExpLaboral();
        $explaboral->estudiante_id = $estudiante->id;
        $explaboral->area_laboral_id = $request->area_laboral_id;
        $explaboral->institucion = $request->institucion;
        $explaboral->puesto = $request->puesto;
        $explaboral->fechainicial = $request->fechainicial;
        $explaboral->fechafin = $request->fechafin;
        $explaboral->descripcion = $request->descripcion;
        $explaboral->estado=1;
// dd($estudiante);
        $explaboral->save();
        return redirect()->route('exp_laboral.index');
    }
}
