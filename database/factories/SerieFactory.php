<?php

namespace Database\Factories;

use App\Models\Serie;
use App\Models\Category;
use Illuminate\Database\Eloquent\Factories\Factory;

class SerieFactory extends Factory
{
    protected $model = Serie::class;

    public function definition(): array
    {
        $annoInizio = $this->faker->year();
        return [
            'titolo' => ucfirst($this->faker->words(3, true)),
            'descrizione' => $this->faker->paragraph(),
            'anno_inizio' => $annoInizio,
            'anno_fine' => rand(0, 1) ? $annoInizio + rand(1, 5) : null,
            'stagioni' => $this->faker->numberBetween(1, 10),
            'regista' => $this->faker->name(),
            'category_id' => Category::inRandomOrder()->first()?->id ?? Category::factory(),
        ];
    }
}
