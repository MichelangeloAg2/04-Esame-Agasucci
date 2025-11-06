<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use App\Models\Episodio;

class EpisodioSeeder extends Seeder
{
    public function run(): void
    {
        // Episodi Manuali per la serie id = 1 (Breaking Bad)
        Episodio::create([
            'titolo' => 'Pilot',
            'numero_episodio' => 1,
            'stagione' => 1,
            'descrizione' => 'Walter scopre la sua diagnosi.',
            'data_uscita' => '2008-01-20',
            'serie_id' => 1,
        ]);

        Episodio::create([
            'titolo' => 'Cat\'s in the Bag...',
            'numero_episodio' => 2,
            'stagione' => 1,
            'descrizione' => 'Conseguenze del primo episodio.',
            'data_uscita' => '2008-01-27',
            'serie_id' => 1,
        ]);

        // Genera altri episodi con factory
        \App\Models\Episodio::factory()->count(12)->create();
    }
}
