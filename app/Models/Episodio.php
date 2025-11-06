<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Episodio extends Model
{
    use HasFactory;

    protected $table = 'episodi';

    protected $fillable = [
        'titolo',
        'numero_episodio',
        'stagione',
        'descrizione',
        'data_uscita',
        'serie_id',
        'image_path',
        'video_path',
    ];

    // Relazione con Serie
    public function serie()
    {
        return $this->belongsTo(Serie::class);
    }
}
