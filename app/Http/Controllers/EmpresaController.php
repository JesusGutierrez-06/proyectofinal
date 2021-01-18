<?php

namespace App\Http\Controllers;

use App\Models\Admin;
use App\Models\Contacto;
use Illuminate\Http\Request;
use App\Models\Empresa;
use Illuminate\Support\Facades\DB;
use App\Models\Departamento;
use Barryvdh\DomPDF\Facade;
use Barryvdh\DomPDF\PDF;

class EmpresaController extends Controller
{
    //
    public function index(Request $request)
    {
        $tipo = $request->get('tipo');
        $buscar = $request->get('buscar');
        if (empty($tipo)) {
        $tipo = "nombre";
        }elseif($tipo =="Buscar por"){
            $tipo="nombre";
            $buscar="";
        }
        $data = DB::table('empresa')
            ->join('departamento', 'empresa.dpto_id', '=', 'departamento.id')
            ->select('empresa.*', 'departamento.nombre as departamento')
            ->where('empresa.'.$tipo.'', 'like', '%' . $buscar . '%')
            ->orderBy('empresa.id', 'asc')
            ->paginate(5);
        // return dd($data);
        // $data = Admin::All();
        // return $data;
        return view('empresa.index', compact('data', 'buscar'));

        // return view('empresa.index');
    }
    public function create($id)
    {
        $departamento = Departamento::All();
        $admin = Admin::find($id);
        $todos['departamento'] = $departamento;
        $todos['admin'] = $admin;
        // return $todos['admin'];

        return view('empresa.create', compact('todos'));
        // return view('empresa.create');
    }
    // public function getProvincia(Request $request,$id)
    // {
    //     if($request->ajax()){
    //         $provincias = Provincias::provincias($id);
    //         return response()->json($provincias);
    //     }
    // }
    public function store(Request $request)
    {
        // return $request->all();
        $request->validate([
            'dpto_id' => 'required',
            'nombre' => 'required',
            'direccion' => 'required',
            'url_pagina' => 'required',
            'descripcion' => 'required|string|max:500',
            'celular' => 'required|numeric|min:8',
            'nit' => 'required|numeric',
            'logo' => 'image'
        ]);

        $empresa = new Empresa();
        $empresa->dpto_id = $request->dpto_id;
        $empresa->nombre = ucwords(strtolower($request->nombre));
        $empresa->direccion = ucwords(strtolower($request->direccion));
        $empresa->url_pagina = ucwords(strtolower($request->url_pagina));
        $empresa->descripcion = ucwords(strtolower($request->descripcion));
        $empresa->celular = $request->celular;
        $empresa->telefono = $request->telefono;
        $empresa->nit = $request->nit;
        $empresa->logo = $request->image->store('public');
        $empresa->estado = 1;
        // $empresa->users_id=$request->users_id;

        $id = $request->users_id;
        $id = explode(',', $id);
        $id = explode(':', $id[0]);
        $id = explode(':', $id[1]);
        $empresa->users_id = $id[0];
        $empresa->save();
        $empresa->users = $request->users_id;
        $users_id = $id[0] . "-" . $empresa->id;
        // dd($empresa);
        return redirect()->route('contacto.create', $users_id);
    }
    public function show(Empresa $empresa)
    {

        // return $empresa->dpto_id;
        // return $empresa;
        // dd($empresa);
        // $departamento = $empresa->dpto_id;
        // $data['departamento'] = Departamento::find($departamento->dpto_id);
        // $data['empresa']=$empresa;
        // return $data;
        $contacto = Contacto::all()->where('empresa_id', $empresa->id);
        $data['contacto'] = $contacto;
        $data['empresa'] = $empresa;
        // dd($data);
        return view('empresa.show', compact('data'));
    }

    public function edit($empresa)
    {
        $empresa = explode(':', $empresa);

        if (count($empresa) > 1) {
            $tmp = $empresa[1];
            $empresa = Empresa::Where('users_id', '=', $empresa[1])->first();
        } else {
            $empresa = Empresa::Where('id', '=', $empresa[0])->first();
        }
        if (empty($empresa)) {
            // dd($tmp);
            return redirect()->route('empresa.create', $tmp);
            // return view('empresa.create', compact('tmp'));
        }

        $departamento = Departamento::All();
        // dd($empresa);
        return view('empresa.edit', compact('empresa', 'departamento'));
    }
    public function update(Request $request, Empresa $empresa)
    {

        $request->validate([
            'image' => 'image'
        ]);

        $empresa->dpto_id = $request->dpto_id;
        $empresa->users_id = $request->users_id;
        $empresa->nombre = ucwords(strtolower($request->nombre));
        $empresa->direccion = ucwords(strtolower($request->direccion));
        $empresa->url_pagina = ucwords(strtolower($request->url_pagina));
        $empresa->descripcion = ucwords(strtolower($request->descripcion));
        $empresa->celular = $request->celular;
        $empresa->telefono = $request->telefono;
        $empresa->nit = $request->nit;
        $empresa->logo = $request->image->store('public');
        $empresa->estado = 1;
        // dd($empresa);
        $empresa->save();
        return redirect()->route('empresa.index');
    }
    public function destroy(Request $request, Empresa $empresa)
    {
        $empresa->estado = $request->estado;
        // dd($empresa);
        $empresa->save();
        return redirect()->route('empresa.index')->with('eliminar', 'ok');
    }
    public function graficos()
    {
        $data['usuarios'] = DB::table('users')
            ->select(
                'users.*',
            )
            ->orderBy('users.id', 'asc')
            ->get();
        $data['empresas'] = DB::table('empresa')
            ->select(
                'empresa.*',
            )
            ->where('empresa.estado', '=', '1')
            ->orderBy('empresa.id', 'asc')
            ->get();
        $data['estudiantes'] = DB::table('estudiante')
            ->select(
                'estudiante.*',
            )
            ->where('estudiante.estado', '=', '1')
            ->orderBy('estudiante.id', 'asc')
            ->get();
        $cantidad = [];
        foreach ($data['empresas'] as $user) {
            $cantidad[] = DB::table('oferta_laboral')
            ->join('empresa', 'empresa.id', '=', 'oferta_laboral.empresa_id')
                ->select(
                    'oferta_laboral.*',
                    'empresa.nombre as empresa'
                )
                ->where('oferta_laboral.empresa_id', '=', $user->id)
                ->orderBy('oferta_laboral.empresa_id', 'asc')
                ->get();
        }
        for ($i = 0; $i < count($cantidad); $i++) {
            if (count($cantidad[$i]) > 0) {
                $cantidades[] = $cantidad[$i];
            }
        }
        for ($i = 1; $i < count($cantidades); $i++) {
            for ($j = 0; $j < count($cantidades) - $i; $j++) {
                if ($cantidades[$j] < $cantidades[$j + 1]) {
                    $k = $cantidades[$j + 1];
                    $cantidades[$j + 1] = $cantidades[$j];
                    $cantidades[$j] = $k;
                }
            }
        }
        // dd($cantidades);
        return view('reportes.graficos', compact('data', 'cantidades'));
    }
    public function imprimir()
    {
        $data = DB::table('empresa')
            ->join('departamento', 'empresa.dpto_id', '=', 'departamento.id')
            ->select('empresa.*', 'departamento.nombre as departamento')
            ->get();
        $pdf = Facade::setOptions(['isHtml5ParserEnabled' => true, 'isRemoteEnabled' => true]);
        $pdf = Facade::loadView('reportes.empresa', compact('data'))
            ->setPaper('letter');
        // dd($data);
        return $pdf->stream('filename.pdf');
        // view()->share('data',$data);
        // $pdf = PDF::loadView('reportes.admin', $data);
        // return $pdf->download('imprimir.pdf');
    }
}
