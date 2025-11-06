<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use App\Models\User as Utente;

class Credito extends Model
{
    use HasFactory;

    protected $table = 'crediti';

    protected $fillable = [
        'utente_id',
        'saldo',
    ];

    public function utente()
    {
        return $this->belongsTo(Utente::class, 'utente_id');
    }
}
