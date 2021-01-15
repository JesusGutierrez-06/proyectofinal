<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class AreaLaboral extends Model
{
    use HasFactory;
    protected $table='area_laboral';
    protected $fillable = [
        'id',
        'nombre',
        'estado',
    ];
}
