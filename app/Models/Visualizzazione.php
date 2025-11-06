<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Visualizzazione extends Model
{
    use HasFactory;

    protected $table = 'visualizzazioni';
    protected $fillable = [
        'utente_id',
        'film_id',
        'episodio_id',
        'secondi_guardati',
        'data_ultima_visione'
    ];

    public function utente()
    {
        return $this->belongsTo(User::class, 'utente_id', 'idUtente');
    }

    public function film()
    {
        return $this->belongsTo(Film::class, 'film_id', 'id');
    }

    public function episodio()
    {
        return $this->belongsTo(Episodio::class, 'episodio_id', 'id');
    }
}
