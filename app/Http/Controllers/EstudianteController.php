<?php

namespace App\Http\Controllers;
use Barryvdh\DomPDF\Facade;
use App\Models\Estudiante;
use App\Models\Departamento;
use App\Models\Provincia;
use App\Models\EstadoCivil;
use App\Models\TipoSangre;
use App\Models\Genero;
use App\Models\Admin;
use Illuminate\Support\Facades\DB;
use Illuminate\Http\Request;
class EstudianteController extends Controller
{
    public function index(Request $request){
        $buscar= $request->get('buscar');
        $data= DB::table('estudiante')
        ->join('provincia','provincia.id','=','estudiante.provincia_id')
        ->join('tipo_sangre','tipo_sangre.id','=','estudiante.tipo_sangre_id')
        ->join('genero','genero.id','=','estudiante.genero_id')
        ->join('estado_civil','estado_civil.id','=','estudiante.estado_civil_id')
        ->join('departamento','provincia.dpto_id','=','departamento.id')
        ->select('estudiante.*','departamento.nombre as departamento',
        'provincia.nombre as provincia','tipo_sangre.nombre as tipo_sangre',
        'genero.nombre as genero','estado_civil.nombre as estado_civil')
        ->where('estudiante.nombre','like','%'.$buscar.'%')
        ->orderBy('estudiante.id','asc')
        ->paginate(5);
        // return dd($data);
        // $data = Admin::All();        
        return view('estudiante.index', compact('data','buscar'));
        // return view('estudiante.index');
    }
    public function create($id){
        $departamento = Departamento::All();
        $provincia = Provincia::All();
        $estado_civil = EstadoCivil::All();
        $tipo_sangre = TipoSangre::All();
        $genero = Genero::All();
        $admin = Admin::find($id);
        $todos['genero']= $genero;
        $todos['tipo_sangre']= $tipo_sangre;
        $todos['provincia']= $provincia;
        $todos['departamento']= $departamento;
        $todos['estado_civil']= $estado_civil;
        $todos['admin']= $admin;
        // return $todos['admin'];
        // dd($todos);
        return view('estudiante.create', compact('todos'));
        // return view('estudiante.create');
    }
    public function store(Request $request){
        // return $request->all();
        $request->validate([
            'image'=> 'image'
        ]);

        $estudiante = new Estudiante();
        $estudiante->genero_id = $request->genero_id;
        $estudiante->estado_civil_id = $request->estado_civil_id;
        $estudiante->tipo_sangre_id = $request->tipo_sangre_id;
        $estudiante->provincia_id = $request->provincia_id;
        $estudiante->users_id = $request->users_id;
        $estudiante->matricula = $request->matricula;
        $estudiante->nombre = ucwords(strtolower($request->nombre));
        $estudiante->apellidop = ucwords(strtolower($request->apellidop));
        $estudiante->apellidom = ucwords(strtolower($request->apellidom));
        $estudiante->direccion = ucwords(strtolower($request->direccion));
        $estudiante->fechanac = $request->fechanac;
        $estudiante->telefono = $request->telefono;
        $estudiante->celular = $request->celular;
        $estudiante->dni = $request->dni;
        $estudiante->foto= $request->image->store('public');
        $estudiante->estado=1;
// dd($estudiante);
        $estudiante->save();
        return redirect()->route('estudiante.show',$estudiante );
    }
    public function show( $estudiante){

        // return $estudiante;
        // dd($estudiante);

        $estudiante= explode(':',$estudiante);
        
        if (count($estudiante)>0) {
            $estudiante = Estudiante::Where('users_id','=',$estudiante[1])->first();
        
        }else{

            $estudiante = Estudiante::Where('id','=',$estudiante[0])->first();

        }
        
        $data['estudios']= DB::table('estudios')
        ->join('carrera','carrera.id','=','estudios.carrera_id')
        ->select('estudios.*','carrera.nombre as carrera')
        ->where('estudios.estudiante_id','=',$estudiante->id)
        ->orderBy('estudios.id','asc')
        ->get();    
        $data['capacitacion']= DB::table('capacitacion')
        ->join('tipo_capa','tipo_capa.id','=','capacitacion.tipo_capa_id')
        ->join('area_capa','area_capa.id','=','capacitacion.area_capa_id')
        ->select('capacitacion.*','tipo_capa.nombre as tipo_capa',
        'area_capa.nombre as area_capa')
        ->where('capacitacion.estudiante_id','=',$estudiante->id)
        ->orderBy('capacitacion.id','asc')
        ->get();
        $data['provincia'] = Provincia::find($estudiante->provincia_id);
        $data['tipo_sangre'] = TipoSangre::find($estudiante->tipo_sangre_id);
        $data['genero'] = Genero::find($estudiante->genero_id);
        $departamento = $data['provincia'];
        $data['departamento'] = Departamento::find($departamento->dpto_id);
        $data['users'] = Admin::find($estudiante->users_id);
        $data['estado_civil'] = EstadoCivil::find($estudiante->estado_civil_id);
        $data['estudiante']= $estudiante;
        // return $data;
        return view('estudiante.show', compact('data'));
    }

    public function edit($estudiante){
        
        $estudiante= explode(':',$estudiante);
        
        if (count($estudiante)>1) {
            $estudiante = Estudiante::Where('users_id','=',$estudiante[1])->first();
        }else{
            $estudiante = Estudiante::Where('id','=',$estudiante[0])->first();
        }

        $departamento = Departamento::All();
        $provincia = Provincia::All();
        $estado_civil = EstadoCivil::All();
        $tipo_sangre = TipoSangre::All();
        $genero = Genero::All();
        return view('estudiante.edit', compact('estudiante','departamento','provincia','estado_civil','tipo_sangre','genero'));
    }
    public function update(Request $request, Estudiante $estudiante){

        $request->validate([
            'image'=> 'image'
        ]);
        $estudiante->genero_id = $request->genero_id;
        $estudiante->estado_civil_id = $request->estado_civil_id;
        $estudiante->tipo_sangre_id = $request->tipo_sangre_id;
        $estudiante->provincia_id = $request->provincia_id;
        $estudiante->users_id = $request->users_id;
        $estudiante->matricula = $request->matricula;
        $estudiante->nombre = ucwords(strtolower($request->nombre));
        $estudiante->apellidop = ucwords(strtolower($request->apellidop));
        $estudiante->apellidom = ucwords(strtolower($request->apellidom));
        $estudiante->direccion = ucwords(strtolower($request->direccion));
        $estudiante->fechanac = $request->fechanac;
        $estudiante->telefono = $request->telefono;
        $estudiante->celular = $request->celular;
        $estudiante->dni = $request->dni;
        $estudiante->foto= $request->image->store('public');
        // dd($estudiante);
        $estudiante->estado=1;
        $estudiante->save();
        return redirect()->route('postular.index');
    }
    public function destroy($estudiante){
        $estudiante= explode(':',$estudiante);
        
        if (count($estudiante)>0) {
            $estudiante = Estudiante::Where('users_id','=',$estudiante[1])->first();
        
        }else{

            $estudiante = Estudiante::Where('id','=',$estudiante[0])->first();

        }
        $estudiante->estado =0;
        // dd($empresa);
        $estudiante->save();
        return redirect()->route('estudiante.index');
    }
    public function imprimir(){
        $data= DB::table('estudiante')
        ->join('provincia','provincia.id','=','estudiante.provincia_id')
        ->join('tipo_sangre','tipo_sangre.id','=','estudiante.tipo_sangre_id')
        ->join('genero','genero.id','=','estudiante.genero_id')
        ->join('estado_civil','estado_civil.id','=','estudiante.estado_civil_id')
        ->join('departamento','provincia.dpto_id','=','departamento.id')
        ->select('estudiante.*','departamento.nombre as departamento',
        'provincia.nombre as provincia','tipo_sangre.nombre as tipo_sangre',
        'genero.nombre as genero','estado_civil.nombre as estado_civil')
        ->get();
         $pdf = Facade::loadView('reportes.estudiante', compact('data'));
        // dd($data);
        return $pdf->stream('filename.pdf');
        // view()->share('data',$data);
        // $pdf = PDF::loadView('reportes.admin', $data);
        // return $pdf->download('imprimir.pdf');
    }
    public function curriculum($estudiante){
        $estudiante= explode(':',$estudiante);
        
        if (count($estudiante)>1) {
            $estudiante = Estudiante::Where('users_id','=',$estudiante[1])->first();
        }else{
            $estudiante = Estudiante::Where('id','=',$estudiante[0])->first();
        }
        $data['estudios']= DB::table('estudios')
        ->join('carrera','carrera.id','=','estudios.carrera_id')
        ->select('estudios.*','carrera.nombre as carrera')
        ->where('estudios.estudiante_id','=',$estudiante->id)
        ->orderBy('estudios.id','asc')
        ->get();    
        $data['capacitacion']= DB::table('capacitacion')
        ->join('tipo_capa','tipo_capa.id','=','capacitacion.tipo_capa_id')
        ->join('area_capa','area_capa.id','=','capacitacion.area_capa_id')
        ->select('capacitacion.*','tipo_capa.nombre as tipo_capa',
        'area_capa.nombre as area_capa')
        ->where('capacitacion.estudiante_id','=',$estudiante->id)
        ->orderBy('capacitacion.id','asc')
        ->get();
        $data['estudios_idioma']= DB::table('estudios_idioma')
        ->join('idioma','idioma.id','=','estudios_idioma.idioma_id')
        ->select('estudios_idioma.*','idioma.nombre as idioma')
        ->where('estudios_idioma.estudiante_id','=',$estudiante->id)
        ->orderBy('estudios_idioma.id','asc')
        ->get();
        $data['exp_laboral']= DB::table('exp_laboral')
        ->join('area_laboral','area_laboral.id','=','exp_laboral.area_laboral_id')
        ->select('exp_laboral.*','area_laboral.nombre as area_laboral')
        ->where('exp_laboral.estudiante_id','=',$estudiante->id)
        ->orderBy('exp_laboral.id','asc')
        ->get();
        $data['provincia'] = Provincia::find($estudiante->provincia_id);
        $data['tipo_sangre'] = TipoSangre::find($estudiante->tipo_sangre_id);
        $data['genero'] = Genero::find($estudiante->genero_id);
        $departamento = $data['provincia'];
        $data['departamento'] = Departamento::find($departamento->dpto_id);
        $data['users'] = Admin::find($estudiante->users_id);
        $data['estado_civil'] = EstadoCivil::find($estudiante->estado_civil_id);
        $data['estudiante']= $estudiante;
        $pdf = Facade::loadView('reportes.curriculum', compact('data'));
        // dd($data);
        return $pdf->stream('filename.pdf');
    }
}
