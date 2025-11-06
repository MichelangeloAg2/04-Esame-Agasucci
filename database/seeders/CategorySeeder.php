<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use App\Models\Category;

class CategorySeeder extends Seeder
{
    public function run(): void
    {
        $categories = [
            'Azione',
            'Drammatico',
            'Commedia',
            'Fantascienza',
            'Documentario',
            'Horror',
            'Animazione'
        ];

        foreach ($categories as $c) {
            Category::create(['nome' => $c]);
        }
    }
}
