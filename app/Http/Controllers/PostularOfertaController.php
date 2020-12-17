<?php

namespace App\Http\Controllers;

use App\Models\Empresa;
use App\Models\Estudiante;
use Illuminate\Http\Request;
use App\Models\PostularOferta;
use Illuminate\Support\Carbon;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;

class PostularOfertaController extends Controller
{
    //
    public function index()
    {

        if(Auth::user()->tipo_usuario_id == '2'){
            $estudiante =Estudiante::where('users_id','=',Auth::user()->id)->first();
            $data = DB::table('postular_oferta')
            ->join('oferta_laboral','oferta_laboral.id','=','postular_oferta.oferta_laboral_id')
            ->join('empresa','empresa.id','=','oferta_laboral.empresa_id')
            ->join('departamento','departamento.id','=','empresa.dpto_id')
            ->select(
                'oferta_laboral.*','postular_oferta.id as postular_oferta_id','postular_oferta.fecha_postulacion',
                'postular_oferta.estado_preseleccion','postular_oferta.aspiracion_salarial',
                'empresa.nombre as empresa','departamento.nombre as departamento'
            )
            ->where('postular_oferta.estudiante_id','=',$estudiante->id)
            ->where('postular_oferta.estado','=',1)
            ->get();
            // dd($data);
            return view('ofertas.postular_oferta.index', compact('data'));

        }elseif(Auth::user()->tipo_usuario_id == '3'){
            $empresa =Empresa::where('users_id','=',Auth::user()->id)->first();
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
            ->where('empresa.id','=',$empresa->id)
            ->where('oferta_laboral.estado','=',1)
            ->orderBy('oferta_laboral.id', 'asc')
            ->get();
                foreach ($data as $user) {
                    // $cantidad = PostularOferta::find($user->oferta_laboral_id);
            $cantidad[] = DB::table('postular_oferta')
            ->join('oferta_laboral', 'oferta_laboral.id', '=', 'postular_oferta.oferta_laboral_id')
            ->select(
                'postular_oferta.*'            )
            ->where('postular_oferta.oferta_laboral_id','=',$user->id)
            ->where('postular_oferta.estado','=',1)
            ->orderBy('postular_oferta.id', 'asc')
            ->get();

                }
                return view('ofertas.postular_oferta.index', compact('data','cantidad'));

            }

        // dd(count($cantidad[0]));
            // dd(count($cantidad));
    }
    public function create($id)
    {
        // dd($id);
        // $carrera = Carrera::All();
        // $tipo_sueldo = TipoSueldo::All();
        // $contrato = Contrato::All();
        // $salario = Salario::All();
        // $todos['carrera']=$carrera;
        // $todos['salario']=$salario;
        // $todos['tipo_sueldo']=$tipo_sueldo;
        // $todos['contrato']=$contrato;
        // // return $todos['admin'];
        // // dd($todos);
        // return view('ofertas.create', compact('todos'));
        // return view('postular_oferta.create');
    }
    public function store(Request $request)
    {
        // return $request->all();
        // $date = new Date();
        $postular_oferta = new PostularOferta();
        $postular_oferta->estudiante_id = $request->estudiante_id;
        $postular_oferta->oferta_laboral_id = $request->oferta_laboral_id;
        $postular_oferta->aspiracion_salarial = $request->aspiracion_salarial;
        $postular_oferta->estado_preseleccion = 0;
        $postular_oferta->estado = 1;
        $postular_oferta->fecha_postulacion = Carbon::now('america/la_paz')->toDateString();
        // dd($postular_oferta);
        // dd($postular_oferta);
        $postular_oferta->save();
        return redirect()->route('postular.index', $postular_oferta);
    }
    public function show($postular_oferta)
    {
        // $data = PostularOferta::all()->where('oferta_laboral_id','=',$postular_oferta)->where('estudiante_id','=','2');
        // dd($estudiante);
        $empresa = Empresa::where('users_id','=',Auth::user()->id)->first();
        
        $data = DB::table('postular_oferta')
            ->join('estudiante', 'estudiante.id', '=', 'postular_oferta.estudiante_id')
            ->join('oferta_laboral', 'oferta_laboral.id', '=', 'postular_oferta.oferta_laboral_id')
            ->select(
                'postular_oferta.*',
                'estudiante.nombre',
                'estudiante.apellidop',
                'estudiante.apellidom',
                'estudiante.celular',
                'estudiante.telefono',
                'oferta_laboral.titulo',                
            )
            ->where('postular_oferta.oferta_laboral_id', '=', $postular_oferta)
            ->where('postular_oferta.estado','=',1)
            ->orderBy('postular_oferta.id', 'asc')
            ->paginate(5);
        // dd($data);
        return view('ofertas.postular_oferta.show', compact('data'));
    }

    public function edit(PostularOferta $postular_oferta)
    {
        // $carrera = Carrera::All();
        // $salario = Salario::All();
        // $contrato = Contrato::All();
        // $tipo_sueldo = TipoSueldo::All();
        // $empresa = Empresa::All();
        // return view('ofertas.edit', compact('postular_oferta','carrera','salario','contrato','tipo_sueldo','empresa'));
    }
    public function update(Request $request, $postular_oferta)
    {

        $oferta = $request->oferta_laboral_id;
        $postular_oferta = PostularOferta::find($postular_oferta);
        $postular_oferta->estado_preseleccion = $request->preseleccion;
        $postular_oferta->save();
        // dd($oferta);
        return redirect()->route('postular.show', $oferta);
    }
    public function destroy($postular_oferta)
    {
        $postular_oferta = PostularOferta::find($postular_oferta);
        // dd($postular_oferta);
        $postular_oferta->estado = 0;
        // dd($empresa);
        $postular_oferta->save();
        return redirect()->route('postular.index')->with('eliminar','ok');
    }
}
