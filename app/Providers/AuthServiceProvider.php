<?php

namespace App\Providers;

use Illuminate\Foundation\Support\Providers\AuthServiceProvider as ServiceProvider;
use Illuminate\Support\Facades\Gate;
use App\Models\User as Utente;

class AuthServiceProvider extends ServiceProvider
{
    /**
     * Register any authentication / authorization services.
     */
    public function boot(): void
    {
        // Gate per ruolo ADMIN
        Gate::define('access-admin', fn(Utente $utente) => $utente->ruolo === 'admin');

        // Gate per ruolo USER
        Gate::define('is-user', fn(Utente $utente) => $utente->ruolo === 'user');

        // Gate per ruolo GUEST
        Gate::define('is-guest', fn(Utente $utente) => $utente->ruolo === 'guest');

        // Gate per abbonamento attivo
        Gate::define('hasSubscription', fn(Utente $utente) => (bool) $utente->abbonamento_attivo);
    }
}
