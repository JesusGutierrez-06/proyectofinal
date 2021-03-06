<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class AreaCapa extends Model
{
    use HasFactory;
    protected $table='area_capa';
    protected $fillable = [
        'id',
        'nombre',
        'estado',
    ];
}
