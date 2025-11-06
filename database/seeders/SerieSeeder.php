<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use App\Models\Serie;
use App\Models\Category;
use Carbon\Carbon;

class SerieSeeder extends Seeder
{
    public function run(): void
    {
        // Recupera la prima categoria esistente (creata da CategorySeeder)
        // oppure ne crea una di default se non esiste
        $categoria = Category::first() ?? Category::create([
            'nome' => 'Dramma',
            'descrizione' => 'Serie di genere drammatico',
        ]);

        // Serie di esempio
        Serie::create([
            'titolo' => 'Breaking Bad',
            'descrizione' => 'La trasformazione di Walter White.',
            'stagioni' => 5,
            'anno_inizio' => 2008,
            'anno_fine' => 2013,
            'regista' => 'Vince Gilligan',
            'category_id' => $categoria->id, // ✅ chiave esterna
            'created_at' => Carbon::create(2008, 1, 20),
            'updated_at' => now(),
        ]);

        // Crea altre 3 serie con factory
        \App\Models\Serie::factory()
            ->count(3)
            ->create([
                'category_id' => $categoria->id,
            ]);
    }
}
