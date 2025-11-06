<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use App\Models\Episodio;
use App\Models\Serie;

class EpisodiSeeder extends Seeder
{
    public function run(): void
    {
        $serie = Serie::all();

        foreach ($serie as $s) {
            for ($i = 1; $i <= 5; $i++) {
                Episodio::create([
                    'serie_id' => $s->id,
                    'titolo' => "Episodio $i",
                    'descrizione' => "Descrizione dell'episodio $i di {$s->titolo}",
                    'numero' => $i,
                ]);
            }
        }
    }
}
