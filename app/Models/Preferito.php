<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Preferito extends Model
{
    use HasFactory;

    protected $table = 'preferiti';

    protected $fillable = [
        'idUtente',
        'film_id',
        'serie_id',
    ];

    /**
     * Relazioni inverse
     */
    public function utente()
    {
        return $this->belongsTo(User::class, 'idUtente', 'idUtente');
    }

    public function film()
    {
        return $this->belongsTo(Film::class, 'film_id');
    }

    public function serie()
    {
        return $this->belongsTo(Serie::class, 'serie_id');
    }
}
