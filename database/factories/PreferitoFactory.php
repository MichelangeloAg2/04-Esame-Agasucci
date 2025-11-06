<?php

namespace Database\Factories;

use App\Models\Preferito;
use App\Models\User;
use App\Models\Film;
use Illuminate\Database\Eloquent\Factories\Factory;

class PreferitoFactory extends Factory
{
    protected $model = Preferito::class;

    public function definition()
    {
        return [
            'idUtente' => User::inRandomOrder()->first()?->idUtente ?? User::factory(),
            'film_id' => Film::inRandomOrder()->first()?->id ?? Film::factory(),
            'serie_id' => null,
        ];
    }
}
