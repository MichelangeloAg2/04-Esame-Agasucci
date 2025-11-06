<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Testing\Fluent\Concerns\Has;

class Nazione extends Model
{
    use HasFactory;

    protected $table = 'nazioni';
    protected $primaryKey = 'idNazione';

    protected $fillable = [
        'nome',
        'iso',
        'iso3',
        'prefissoTelefonisco'
    ];
}
