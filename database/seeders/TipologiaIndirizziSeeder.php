<?php

namespace Database\Seeders;


use Illuminate\Database\Seeder;
use App\Models\TipologiaIndirizzo;

class TipologiaIndirizziSeeder extends Seeder
{
    /**
     * @return void
     */
    public function run()
    {
        TipologiaIndirizzo::create(['idTipologiaIndirizzo' => 1, 'nome' => 'Residenza']);
        TipologiaIndirizzo::create(['idTipologiaIndirizzo' => 2, 'nome' => 'Domicilio']);
        TipologiaIndirizzo::create(['idTipologiaIndirizzo' => 3, 'nome' => 'Indirizzo di Spedizione']);
        TipologiaIndirizzo::create(['idTipologiaIndirizzo' => 4, 'nome' => 'Ufficio']);
        TipologiaIndirizzo::create(['idTipologiaIndirizzo' => 5, 'nome' => 'Sede Legale']);
        TipologiaIndirizzo::create(['idTipologiaIndirizzo' => 6, 'nome' => 'Sede Operativa']);
    }
}
