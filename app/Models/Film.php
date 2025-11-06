<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Film extends Model
{
    use HasFactory;
    protected $table = 'film';

    protected $fillable = [
        'titolo',
        'descrizione',
        'anno_uscita',
        'durata',
        'regista',
        'category_id',
        'image_path',
        'video_path',
    ];

    // Relazione con la categoria
    public function categoria()
    {
        return $this->belongsTo(Category::class, 'category_id');
    }


    public function visualizzazioni()
    {
        return $this->hasMany(Visualizzazione::class, 'film_id');
    }
}
