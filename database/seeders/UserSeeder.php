<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use App\Models\User;
use Illuminate\Support\Facades\Hash;

class UserSeeder extends Seeder
{
    public function run(): void
    {
        // Admin 
        User::create([
            'nome' => 'Admin',
            'cognome' => 'Root',
            'email' => 'admin@codex.local',
            'password' => Hash::make('AdminPass123!'),
            'ruolo' => 'admin',
            'crediti' => 1000,
            'abbonamento_attivo' => true,
            'film_preferiti' => json_encode([]),
            'serie_preferiti' => json_encode([]),
        ]);

        // Utente 
        User::create([
            'nome' => 'Mario',
            'cognome' => 'Rossi',
            'email' => 'mario@codex.local',
            'password' => Hash::make('UserPass123!'),
            'ruolo' => 'user',
            'crediti' => 50,
            'abbonamento_attivo' => true,
            'film_preferiti' => json_encode([]),
            'serie_preferiti' => json_encode([]),
        ]);

        // Guest 
        User::create([
            'nome' => 'Ospite',
            'cognome' => 'Generico',
            'email' => 'guest@codex.local',
            'password' => Hash::make('GuestPass123!'),
            'ruolo' => 'guest',
            'crediti' => 0,
            'abbonamento_attivo' => false,
            'film_preferiti' => json_encode([]),
            'serie_preferiti' => json_encode([]),
        ]);

        // Genera 20 utenti finti con factory
        User::factory()->count(20)->create();
    }
}
