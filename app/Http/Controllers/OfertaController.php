<?php

namespace App\Http\Controllers;

use Barryvdh\DomPDF\Facade;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use App\Models\Oferta;
use App\Models\Empresa;
use App\Models\Carrera;
use App\Models\Contacto;
use App\Models\Salario;
use App\Models\TipoSueldo;
use App\Models\Contrato;
use App\Models\Departamento;
use App\Models\Estudiante;
use App\Models\PostularOferta;
use Illuminate\Support\Carbon;
use Illuminate\Support\Facades\Auth;

class OfertaController extends Controller
{
    //
    // protected function name(){
    //     $name= Contacto::all()->where('users_id','=',Auth::user()->id);
    //     // dd($name);
    //     return $name;
    // }


    public function index(Request $request)
    {
        $buscar = $request->get('buscar');
        if(Auth::user()->tipo_usuario_id == '2' or Auth::user()->tipo_usuario_id == '1'){
            $data = DB::table('oferta_laboral')
            ->join('carrera', 'carrera.id', '=', 'oferta_laboral.carrera_id')
            ->join('tipo_sueldo', 'tipo_sueldo.id', '=', 'oferta_laboral.tipo_sueldo_id')
            ->join('salario', 'salario.id', '=', 'oferta_laboral.salario_id')
            ->join('contrato', 'contrato.id', '=', 'oferta_laboral.contrato_id')
            ->join('empresa', 'empresa.id', '=', 'oferta_laboral.empresa_id')
            ->join('departamento', 'departamento.id', '=', 'empresa.dpto_id')
            ->select(
                'oferta_laboral.*',
                'empresa.nombre as empresa',
                'empresa.logo',
                'departamento.nombre as departamento',
                'empresa.id as empresa_id',
                'carrera.nombre as carrera',
                'tipo_sueldo.nombre as tipo_sueldo',
                'salario.nombre as salario',
                'contrato.nombre as contrato'
            )
            ->where('oferta_laboral.titulo', 'like', '%' . $buscar . '%')
            ->orWhere('empresa.nombre','like','%'.$buscar.'%')
            ->orWhere('carrera.nombre','like','%'.$buscar.'%')
            ->orderBy('oferta_laboral.id', 'asc')
            ->get();

        }elseif(Auth::user()->tipo_usuario_id == '3'){
            $empresa= Empresa::where('users_id','=',Auth::user()->id)->first();
            if (empty($empresa)){
                // dd($tmp);
                return redirect()->route('empresa.create', Auth::user()->id);
                // return view('empresa.create', compact('tmp'));
            }
            $data = DB::table('oferta_laboral')
            ->join('carrera', 'carrera.id', '=', 'oferta_laboral.carrera_id')
            ->join('tipo_sueldo', 'tipo_sueldo.id', '=', 'oferta_laboral.tipo_sueldo_id')
            ->join('salario', 'salario.id', '=', 'oferta_laboral.salario_id')
            ->join('contrato', 'contrato.id', '=', 'oferta_laboral.contrato_id')
            ->join('empresa', 'empresa.id', '=', 'oferta_laboral.empresa_id')
            ->join('departamento', 'departamento.id', '=', 'empresa.dpto_id')
            ->select(
                'oferta_laboral.*',
                'empresa.nombre as empresa',
                'empresa.logo',
                'departamento.nombre as departamento',
                'empresa.id as empresa_id',
                'carrera.nombre as carrera',
                'tipo_sueldo.nombre as tipo_sueldo',
                'salario.nombre as salario',
                'contrato.nombre as contrato'
            )
            ->where('oferta_laboral.titulo', 'like', '%' . $buscar . '%')
            ->where('empresa.id','=',$empresa->id)
            ->orderBy('oferta_laboral.id', 'asc')
            ->get();
        }
        return view('ofertas.index', compact('data', 'buscar'));
    }
    public function create()
    {
        $carrera = Carrera::All();
        $tipo_sueldo = TipoSueldo::All();
        $contrato = Contrato::All();
        $salario = Salario::All();
        $users_id=Auth::user()->id;
        $empresa = Empresa::where('users_id','=',$users_id)->first();
        if (empty($empresa)){
            // dd($tmp);
            return redirect()->route('empresa.create', Auth::user()->id);
            // return view('empresa.create', compact('tmp'));
        }

        $todos['carrera'] = $carrera;
        $todos['salario'] = $salario;
        $todos['tipo_sueldo'] = $tipo_sueldo;
        $todos['contrato'] = $contrato;
        $todos['empresa'] = $empresa;
        // dd($todos);
        $todo = Carbon::now();
        $todos['fecha']= $todo->format('Y-m-d');
        // dd($todos);
        return view('ofertas.create', compact('todos'));
    }
    public function store(Request $request)
    {
        $request->validate([
            'carrera_id' =>'required',
            'empresa_id' =>'required',
            'salario_id' =>'required',
            'contrato_id' => 'required',
            'tipo_sueldo_id'=>'required',
            'titulo' =>'required',
            'descripcion' => 'required',
            'vencimiento' => 'required',
            'celular'=> 'numeric|min:7 ',
            'vencimiento'=> 'date',
            'vacantes' => 'numeric|gt:0'
        ]);
            // $cadena = $request->vencimiento;
       
            // dd($cadena);
        $oferta_laboral = new Oferta();
        $oferta_laboral->carrera_id = $request->carrera_id;
        $oferta_laboral->empresa_id = $request->empresa_id;
        $oferta_laboral->salario_id = $request->salario_id;
        $oferta_laboral->tipo_sueldo_id = $request->tipo_sueldo_id;
        $oferta_laboral->contrato_id = $request->contrato_id;
        $oferta_laboral->titulo = ucwords(mb_strtolower($request->titulo));
        $oferta_laboral->descripcion = ucfirst(mb_strtolower($request->descripcion));
        $oferta_laboral->requisito = ucfirst(mb_strtolower($request->requisito));
        $oferta_laboral->vencimiento = $request->vencimiento;
        $oferta_laboral->telefono = $request->telefono;
        $oferta_laboral->celular = $request->celular;
        $oferta_laboral->publicado = Carbon::now('america/la_paz')->toDateString();
        $oferta_laboral->estado = 1;
        $oferta_laboral->save();
        return redirect()->route('ofertas.show', $oferta_laboral);
    }
    public function show($oferta_laboral)
    {
        $oferta_laboral = Oferta::Find($oferta_laboral);
        $empresa = Empresa::find($oferta_laboral->empresa_id);
        $data['carrera'] = Carrera::find($oferta_laboral->carrera_id);
        $data['tipo_sueldo'] = TipoSueldo::find($oferta_laboral->tipo_sueldo_id);
        $data['salario'] = Salario::find($oferta_laboral->salario_id);
        $data['empresa'] = Empresa::find($oferta_laboral->empresa_id);
        $data['departamento'] = Departamento::find($empresa->dpto_id);
        $data['contrato'] = Contrato::find($oferta_laboral->contrato_id);
        $estudiante = Estudiante::where('users_id', '=', Auth::user()->id)->first();
        $usuarioempresa = Empresa::where('users_id', '=', Auth::user()->id)->first();
        $data['estudiante'] = $estudiante;
        $data['usuarioempresa']= $usuarioempresa;
        $data['oferta_laboral'] = $oferta_laboral;
        $data['postular_oferta']= DB::table('postular_oferta')
        ->where('oferta_laboral_id','=',$oferta_laboral->id)
        // ->where('estudiante_id','=',$estudiante->id)
        ->where('estado','=',1)
        ->get();
        // dd($data['usuarioempresa']);
        return view('ofertas.show', compact('data'));
    }
    public function edit(Oferta $oferta_laboral)
    {
        $carrera = Carrera::All();
        $salario = Salario::All();
        $contrato = Contrato::All();
        $tipo_sueldo = TipoSueldo::All();
        $empresa = Empresa::All();
        return view('ofertas.edit', compact('oferta_laboral', 'carrera', 'salario', 'contrato', 'tipo_sueldo', 'empresa'));
    }
    public function update(Request $request, Oferta $oferta_laboral)
    {
        $oferta_laboral->carrera_id = $request->carrera_id;
        $oferta_laboral->empresa_id = $request->empresa_id;
        $oferta_laboral->salario_id = $request->salario_id;
        $oferta_laboral->tipo_sueldo_id = $request->tipo_sueldo_id;
        $oferta_laboral->contrato_id = $request->contrato_id;
        $oferta_laboral->titulo = ucwords(strtolower($request->titulo));
        $oferta_laboral->descripcion = ucfirst(strtolower($request->descripcion));
        $oferta_laboral->requisito = ucfirst(strtolower($request->requisito));
        $oferta_laboral->vencimiento = $request->vencimiento;
        $oferta_laboral->telefono = $request->telefono;
        $oferta_laboral->celular = $request->celular;
        $oferta_laboral->publicado = $request->publicado;
        $oferta_laboral->estado = 1;
        $oferta_laboral->save();
        return redirect()->route('ofertas.index');
    }
    public function destroy(Oferta $oferta_laboral)
    {
        $oferta_laboral->estado = 0;
        $oferta_laboral->save();
        return redirect()->route('ofertas.index');
    }
    public function imprimir(){
        $data = DB::table('oferta_laboral')
            ->join('carrera', 'carrera.id', '=', 'oferta_laboral.carrera_id')
            ->join('tipo_sueldo', 'tipo_sueldo.id', '=', 'oferta_laboral.tipo_sueldo_id')
            ->join('salario', 'salario.id', '=', 'oferta_laboral.salario_id')
            ->join('contrato', 'contrato.id', '=', 'oferta_laboral.contrato_id')
            ->join('empresa', 'empresa.id', '=', 'oferta_laboral.empresa_id')
            ->join('departamento', 'departamento.id', '=', 'empresa.dpto_id')
            ->select(
                'oferta_laboral.*',
                'empresa.nombre as empresa',
                'empresa.logo',
                'departamento.nombre as departamento',
                'empresa.id as empresa_id',
                'carrera.nombre as carrera',
                'tipo_sueldo.nombre as tipo_sueldo',
                'salario.nombre as salario',
                'contrato.nombre as contrato'
            )
            ->orderBy('oferta_laboral.id', 'asc')
            ->get();
            // dd($data);
         $pdf = Facade::loadView('reportes.ofertas', compact('data'))
         ->setPaper('letter');
        // dd($data),'landscape';
        return $pdf->stream('filename.pdf');
        // view()->share('data',$data);
        // $pdf = PDF::loadView('reportes.admin', $data);
        // return $pdf->download('imprimir.pdf');
    }
}
