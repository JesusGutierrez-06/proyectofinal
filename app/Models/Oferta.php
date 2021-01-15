<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Oferta extends Model
{
    use HasFactory;
    protected $table='oferta_laboral';
    protected $fillable = [
        'id',
        'carrera_id',
        'empresa_id',
        'salario_id',
        'tipo_sueldo_id',
        'contrato_id',
        'titulo',
        'descripcion',
        'requisito',
        'publicado',
        'vencimiento',
        'telefono',
        'celular',
        'estado',
    ];
}
