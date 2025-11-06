<?php

namespace Database\Factories;

use App\Models\Film;
use App\Models\Category;
use Illuminate\Database\Eloquent\Factories\Factory;

class FilmFactory extends Factory
{
    protected $model = Film::class;

    public function definition()
    {
        // Assicuriamoci che ci sia sempre una categoria valida
        $category = Category::inRandomOrder()->first();
        if (!$category) {
            $category = Category::factory()->create();
        }

        return [
            'titolo' => ucfirst($this->faker->sentence(3)),
            'descrizione' => $this->faker->paragraph(),
            'anno_uscita' => $this->faker->year(),
            'durata' => $this->faker->numberBetween(80, 180),
            'regista' => $this->faker->name(),
            'category_id' => $category->id,
        ];
    }
}
