<?php

namespace Database\Factories;

use Illuminate\Database\Eloquent\Factories\Factory;
use Illuminate\Support\Str;
use Illuminate\Support\Facades\Hash;
use App\Models\User;

class UserFactory extends Factory
{
    protected $model = User::class;

    public function definition()
    {
        return [
            // campi coerenti con il tuo User model in italiano
            'nome' => $this->faker->firstName(),
            'cognome' => $this->faker->lastName(),
            'email' => $this->faker->unique()->safeEmail(),
            'password' => Hash::make('password'),
            'ruolo' => 'user',
            'crediti' => $this->faker->numberBetween(0, 200),
            'abbonamento_attivo' => $this->faker->boolean(60),
            'film_preferiti' => [],
            'serie_preferiti' => [],
        ];
    }

    public function admin()
    {
        return $this->state(fn(array $attributes) => ['ruolo' => 'admin', 'abbonamento_attivo' => true]);
    }

    public function guest()
    {
        return $this->state(fn(array $attributes) => ['ruolo' => 'guest', 'abbonamento_attivo' => false]);
    }
}
