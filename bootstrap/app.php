<?php

use Illuminate\Foundation\Application;
use Illuminate\Foundation\Configuration\Exceptions;
use Illuminate\Foundation\Configuration\Middleware;

return Application::configure(basePath: dirname(__DIR__))
    ->withRouting(
        web: __DIR__ . '/../routes/web.php',
        commands: __DIR__ . '/../routes/console.php',
        health: '/up',
    )
    ->withMiddleware(function (Middleware $middleware): void {

        // Gruppo middleware API
        $middleware->group('api', [
            \Illuminate\Routing\Middleware\SubstituteBindings::class,
            'throttle:api',
        ]);

        $middleware->alias([
            'ruolo' => \App\Http\Middleware\ControllaRuolo::class,
            'abbonamento' => \App\Http\Middleware\ControlloAbbonamento::class,
            'jwt.auth' => \App\Http\Middleware\JwtAuthenticate::class,
            'jwt.refresh' => \PHPOpenSourceSaver\JWTAuth\Http\Middleware\RefreshToken::class,
            'auth' => \App\Http\Middleware\Authenticate::class,
            'guest' => \App\Http\Middleware\RedirectIfAuthenticated::class,
            'verified' => \Illuminate\Auth\Middleware\EnsureEmailIsVerified::class,
        ]);
    })
    ->withExceptions(function (Exceptions $exceptions): void {
        //
    })
    ->create();
