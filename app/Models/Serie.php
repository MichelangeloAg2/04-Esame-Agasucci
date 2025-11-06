<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use App\Models\Episodio as Episodi;
use App\Models\Category;

class Serie extends Model
{
    use HasFactory;
    protected $table = 'serie';

    protected $fillable = [
        'titolo',
        'descrizione',
        'anno_inizio',
        'anno_fine',
        'stagioni',
        'regista',
        'category_id',
        'image_path',
        'video_path',
    ];

    // Relazione con categoria
    public function categoria()
    {
        return $this->belongsTo(Category::class, 'category_id');
    }

    // Relazione con episodi (che creeremo dopo)
    public function episodi()
    {
        return $this->hasMany(Episodi::class, 'serie_id');
    }
}
