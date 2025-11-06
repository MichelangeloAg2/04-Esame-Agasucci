<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use App\Models\Film;

class FilmSeeder extends Seeder
{
    public function run(): void
    {
        // Se hai factory:
        \App\Models\Film::factory()->count(8)->create();

        // Film espliciti (esempi)
        Film::create([
            'titolo' => 'Inception',
            'descrizione' => 'Un viaggio nei sogni dentro i sogni.',
            'anno_uscita' => 2010,
            'durata' => 148,
            'regista' => 'Christopher Nolan',
            'category_id' => 1,
        ]);

        Film::create([
            'titolo' => 'Interstellar',
            'descrizione' => 'Odissea nello spazio.',
            'anno_uscita' => 2014,
            'durata' => 169,
            'regista' => 'Christopher Nolan',
            'category_id' => 4,
        ]);
    }
}
