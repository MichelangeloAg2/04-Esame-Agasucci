<?php

namespace Database\Factories;

use Illuminate\Database\Eloquent\Factories\Factory;
use App\Models\User as Utente;

class CarteFactory extends Factory
{
    protected $model = \App\Models\Carta::class;

    public function definition()
    {
        return [
            'numero' => $this->faker->creditCardNumber(),
            'cvv' => $this->faker->numberBetween(100, 999),
            'scadenza' => $this->faker->dateTimeBetween('now', '+5 years')->format('Y-m-d'),
            'metodo_pagamento' => 'carta_credito',
            'utente_id' => Utente::factory(), // crea un utente se non passato
        ];
    }
}
