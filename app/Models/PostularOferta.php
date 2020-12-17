<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class PostularOferta extends Model
{
    use HasFactory;
    protected $table='postular_oferta';
    protected $fillable = [
        'estudiante_id',
        'oferta_laboral_id',
        'fecha_postulacion',
        'estado_preseleccion',
        'estado_final_contrato',
        'aspiracion_salarial',
        'estado',
    ];
}
