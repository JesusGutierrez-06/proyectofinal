<?php

namespace App\Http\Controllers;

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
            ->orderBy('oferta_laboral.id', 'asc')
            ->paginate(5);
        return view('ofertas.index', compact('data', 'buscar'));

    }
    public function create()
    {
        $carrera = Carrera::All();
        $tipo_sueldo = TipoSueldo::All();
        $contrato = Contrato::All();
        $salario = Salario::All();
        $users_id=Auth::user()->id;
        $empresa = Empresa::all()->where('users_id','=',$users_id);
        $empresa= $empresa[2];
        $todos['carrera'] = $carrera;
        $todos['salario'] = $salario;
        $todos['tipo_sueldo'] = $tipo_sueldo;
        $todos['contrato'] = $contrato;
        $todos['empresa'] = $empresa;
        return view('ofertas.create', compact('todos'));
    }
    public function store(Request $request)
    {
        $oferta_laboral = new Oferta();
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
        $oferta_laboral->publicado = Carbon::now('america/la_paz')->toDateString();
        $oferta_laboral->estado = 1;
        $oferta_laboral->save();
        return redirect()->route('ofertas.show', $oferta_laboral);
    }
    public function show($oferta_laboral)
    {
        $oferta_laboral = Oferta::Find($oferta_laboral);
        // dd($oferta_laboral);
        $empresa = Empresa::find($oferta_laboral->empresa_id);
        $data['carrera'] = Carrera::find($oferta_laboral->carrera_id);
        $data['tipo_sueldo'] = TipoSueldo::find($oferta_laboral->tipo_sueldo_id);
        $data['salario'] = Salario::find($oferta_laboral->salario_id);
        $data['empresa'] = Empresa::find($oferta_laboral->empresa_id);
        $data['departamento'] = Departamento::find($empresa->dpto_id);
        $data['contrato'] = Contrato::find($oferta_laboral->contrato_id);
        $estudiante = Estudiante::all()->where('users_id', '=', Auth::user()->id);
        $data['estudiante'] = $estudiante[0];
        $data['oferta_laboral'] = $oferta_laboral;
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
        $oferta_laboral->titulo = $request->titulo;
        $oferta_laboral->descripcion = $request->descripcion;
        $oferta_laboral->requisito = $request->requisito;
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
}
