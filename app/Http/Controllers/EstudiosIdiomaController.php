<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Estudiante;
use App\Models\EstudiosIdioma;
use Illuminate\Support\Facades\Auth;

class EstudiosIdiomaController extends Controller
{
    //
    public function store(Request $request){
        // return $request->all();
        $estudiante= Estudiante::where('users_id','=',Auth::user()->id)->first();
        $estudiosidioma = new EstudiosIdioma();
        $estudiosidioma->estudiante_id = $estudiante->id;
        $estudiosidioma->idioma_id = $request->idioma_id;
        $estudiosidioma->hablar = $request->hablar;
        $estudiosidioma->escribir = $request->escribir;
        $estudiosidioma->leer = $request->leer;
        $estudiosidioma->estado=1;
// dd($estudiante);
        $estudiosidioma->save();
        return redirect()->route('exp_laboral.index');
    }
}
