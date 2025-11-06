<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Carta extends Model
{
    use HasFactory;

    protected $table = 'carte';

    protected $fillable = [
        'utente_id',
        'numero',
        'cvv',
        'scadenza',
    ];

    public function utente()
    {
        return $this->belongsTo(User::class, 'utente_id', 'idUtente');
    }
}
