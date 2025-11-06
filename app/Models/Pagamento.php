<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Pagamento extends Model
{
    use HasFactory;

    protected $table = 'pagamenti';

    protected $fillable = [
        'idUtente',
        'metodo_pagamento',
        'numero_carta',
        'scadenza',
        'cvv',
        'predefinita',
        'inizio_abbonamento',
        'fine_abbonamento',
        'tipo_abbonamento',
        'stato',
        'id_transazione',
    ];

    public function utente()
    {
        return $this->belongsTo(User::class, 'idUtente', 'idUtente');
    }
}
