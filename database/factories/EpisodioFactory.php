<?php

namespace Database\Factories;

use Illuminate\Database\Eloquent\Factories\Factory;
use App\Models\Episodio;
use App\Models\Serie;

class EpisodioFactory extends Factory
{
    protected $model = Episodio::class;

    public function definition()
    {
        $serie = Serie::inRandomOrder()->first();
        $stagione = $this->faker->numberBetween(1, $serie->stagioni ?? 1);

        return [
            'titolo' => $this->faker->sentence(4),
            'numero_episodio' => $this->faker->numberBetween(1, 24),
            'stagione' => $stagione,
            'descrizione' => $this->faker->paragraph(),
            'data_uscita' => $this->faker->date(),
            'serie_id' => $serie->id ?? 1,
        ];
    }
}
