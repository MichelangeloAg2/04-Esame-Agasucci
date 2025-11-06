<?php

namespace Tests;

use Illuminate\Foundation\Testing\TestCase as BaseTestCase;
use PHPOpenSourceSaver\JWTAuth\Facades\JWTAuth;
use Illuminate\Foundation\Testing\RefreshDatabase;

abstract class TestCase extends BaseTestCase
{
    use CreatesApplication;
    use RefreshDatabase;

    /**
     * Autentica un utente usando JWT e ritorna la classe test per le richieste
     *
     * @param \App\Models\User $utente
     * @return \Illuminate\Testing\TestResponse
     */
    public function actingAsJWT($utente)
    {
        $token = JWTAuth::fromUser($utente);

        return $this->withHeaders([
            'Authorization' => "Bearer {$token}",
            'Accept' => 'application/json'
        ]);
    }
}
