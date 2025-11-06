<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use App\Models\Nazione;

class NazioniSeeder extends Seeder
{
    /**
     * @return void
     */
    public function run()
    {
        $csv = storage_path('app/csv/stati.csv');
        $file = fopen($csv, 'r');
        while (($data = fgetcsv($file, 200, ',')) !== false) {
            Nazione::create(
                [
                    'idNazione' => $data[0],
                    'nome' => $data[1],
                    'iso' => $data[2],
                    'iso3' => $data[3],
                    'prefissoTelefonisco' => $data[4]
                ]
            );
        }
    }
}
