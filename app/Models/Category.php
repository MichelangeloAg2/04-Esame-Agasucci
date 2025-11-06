<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Category extends Model
{
    use HasFactory;

    protected $fillable = [
        'nome',
        'descrizione',
    ];

    // Relazione con Film
    public function films()
    {
        return $this->hasMany(Film::class);
    }

    // Relazione con Serie
    public function series()
    {
        return $this->hasMany(Serie::class, 'category_id');
    }
}
