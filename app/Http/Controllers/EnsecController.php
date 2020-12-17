<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

class EnsecController extends Controller
{
    //
    public function admision()
    {
        return view('ensec.admision');
    }
    public function about()
    {
        return view('ensec.about');
    }
}
