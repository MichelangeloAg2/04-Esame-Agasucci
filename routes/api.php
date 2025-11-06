<?php

use Illuminate\Support\Facades\Route;

// Controllers principali
use App\Http\Controllers\Api\v1\AuthController;
use App\Http\Controllers\Api\v1\ProfiloController;
use App\Http\Controllers\Api\v1\CategoriaController;
use App\Http\Controllers\Api\v1\FilmController;
use App\Http\Controllers\Api\v1\SerieController;
use App\Http\Controllers\Api\v1\EpisodioController;
use App\Http\Controllers\Api\v1\PreferitoController;
use App\Http\Controllers\Api\v1\PagamentoController;
use App\Http\Controllers\Api\v1\CreditoController;
use App\Http\Controllers\Api\v1\CartaController;
use App\Http\Controllers\Api\v1\TipologiaIndirizzoController;
use App\Http\Controllers\Api\v1\VisualizzazioneController;
use App\Http\Controllers\Api\v1\AdminController;
use App\Http\Controllers\Api\v1\DebugController;
use App\Http\Controllers\Api\v1\MediaController;
use App\Http\Controllers\Api\v1\UtenteMediaController;
use App\Http\Controllers\Api\v1\CatalogoController;

if (!defined('_VERS')) define('_VERS', 'v1');


// ─────────────────────────────────────────────
// API VERSIONATE
// ─────────────────────────────────────────────
Route::prefix('v1')->group(function () {

    // ───────────────────────────────
    // DEBUG
    // ───────────────────────────────
    Route::get('/debug', [DebugController::class, 'index']);

    // ───────────────────────────────
    // AUTENTICAZIONE
    // ───────────────────────────────
    Route::post('/registrazione', [AuthController::class, 'register']);
    Route::post('/login', [AuthController::class, 'login']);

    Route::middleware(['jwt.auth'])->group(function () {
        Route::get('/profilo/base', [AuthController::class, 'me']);
        Route::get('/me', [AuthController::class, 'me']); // alias per test
        Route::post('/logout', [AuthController::class, 'logout']);
        Route::post('/refresh', [AuthController::class, 'refresh']);
    });

    // ───────────────────────────────
    // PREFERITI
    // ───────────────────────────────
    Route::middleware(['jwt.auth'])->group(function () {
        Route::get('/preferiti', [PreferitoController::class, 'index']);
        Route::post('/preferiti', [PreferitoController::class, 'aggiungi']);
        Route::delete('/preferiti/{id}', [PreferitoController::class, 'rimuovi']);
    });

    // ───────────────────────────────
    // PROFILO, INDIRIZZI E PAGAMENTI
    // ───────────────────────────────
    Route::middleware(['jwt.auth'])->group(function () {

        // Profilo
        Route::get('/profilo', [ProfiloController::class, 'mostraProfilo']);
        Route::put('/profilo', [ProfiloController::class, 'aggiornaProfilo']);
        Route::get('/profilo/pagamenti', [ProfiloController::class, 'storicoPagamenti']);

        // Indirizzi
        Route::get('/indirizzi', [TipologiaIndirizzoController::class, 'index']);
        Route::post('/indirizzi', [TipologiaIndirizzoController::class, 'store']);
        Route::put('/indirizzi/{id}', [TipologiaIndirizzoController::class, 'update']);
        Route::delete('/indirizzi/{id}', [TipologiaIndirizzoController::class, 'destroy']);

        // Pagamenti e abbonamento
        Route::get('/pagamenti', [PagamentoController::class, 'index']);
        Route::post('/pagamenti', [PagamentoController::class, 'store']);
        Route::put('/pagamenti/{id}', [PagamentoController::class, 'update']);
        Route::delete('/pagamenti/{id}', [PagamentoController::class, 'destroy']);

        Route::get('/abbonamento', [PagamentoController::class, 'index']);
        Route::post('/abbonamento/attiva', [PagamentoController::class, 'attiva']);
        Route::delete('/abbonamento/{id}', [PagamentoController::class, 'disdici']);
    });

    // ───────────────────────────────
    // CREDITI E CARTE
    // ───────────────────────────────
    Route::middleware(['jwt.auth'])->group(function () {
        // Crediti
        Route::get('/crediti', [CreditoController::class, 'saldo']);
        Route::post('/crediti/ricarica', [CreditoController::class, 'ricarica']);
        Route::post('/crediti/usa', [CreditoController::class, 'usaCredito'])->name('crediti.usa');

        // Carte
        Route::get('/carte', [CartaController::class, 'index']);
        Route::post('/carte', [CartaController::class, 'store']);
        Route::put('/carte/{id}/predefinita', [CartaController::class, 'impostaPredefinita']);
        Route::delete('/carte/{id}', [CartaController::class, 'destroy']);
    });

    // ───────────────────────────────
    // AREA AMMINISTRATIVA
    // ───────────────────────────────
    Route::middleware(['jwt.auth', 'ruolo:admin'])->prefix('admin')->group(function () {

        // Dashboard
        Route::get('/dashboard', [AdminController::class, 'dashboard']);

        // Gestione utenti
        Route::get('/utenti', [AdminController::class, 'listaUtenti']);
        Route::get('/utenti/{id}', [AdminController::class, 'mostraUtente']);
        Route::put('/utenti/{id}', [AdminController::class, 'aggiornaUtente']);
        Route::delete('/utenti/{id}', [AdminController::class, 'eliminaUtente']);

        // Gestione contenuti multimediali
        Route::get('/contenuti', [AdminController::class, 'listaContenuti']);
        Route::post('/film', [AdminController::class, 'creaFilm']);
        Route::post('/serie', [AdminController::class, 'creaSerie']);
        Route::post('/episodio', [AdminController::class, 'creaEpisodio']);
        Route::put('/contenuti/{tipo}/{id}', [AdminController::class, 'aggiornaContenuto']);
        Route::delete('/contenuti/{tipo}/{id}', [AdminController::class, 'eliminaContenuto']);

        // Gestione pagamenti
        Route::get('/pagamenti', [AdminController::class, 'listaPagamenti']);
        Route::delete('/pagamenti/{id}', [AdminController::class, 'eliminaPagamento']);

        // Gestione file multimediali (poster, video)
        Route::prefix('media')->group(function () {
            Route::post('/upload', [MediaController::class, 'upload']);
            Route::get('/{tipo}/{id}', [MediaController::class, 'mostra']);
            Route::delete('/{tipo}/{id}', [MediaController::class, 'elimina']);
        });
    });

    // ───────────────────────────────
    // CATALOGO (accessibile a user e admin)
    // ───────────────────────────────
    Route::middleware(['jwt.auth', 'abbonamento'])->prefix('catalogo')->group(function () {
        Route::get('/', [CatalogoController::class, 'index']);
        Route::get('/ricerca', [CatalogoController::class, 'ricerca']);
        Route::get('/film/{id}', [CatalogoController::class, 'film']);
        Route::get('/serie/{id}', [CatalogoController::class, 'serie']);
        Route::get('/episodio/{id}', [CatalogoController::class, 'episodio']);
        Route::get('/categorie', [CatalogoController::class, 'categorie']);
    });

    // ───────────────────────────────
    // VISUALIZZAZIONI (solo abbonati)
    // ───────────────────────────────
    Route::middleware(['jwt.auth', 'abbonamento'])->group(function () {
        Route::get('/visualizzazioni', [VisualizzazioneController::class, 'index']);
        Route::post('/visualizzazioni', [VisualizzazioneController::class, 'registra']);
        Route::delete('/visualizzazioni/{id}', [VisualizzazioneController::class, 'destroy']);
    });

    // ───────────────────────────────
    // HOME PUBBLICA (solo guest)
    // ───────────────────────────────
    Route::get('/home', fn() => response()->json(['messaggio' => 'Benvenuto su CodeX Streaming!']));

    // ───────────────────────────────
    // CONTENUTI RISERVATI (abbonati o admin)
    // ───────────────────────────────
    Route::middleware(['jwt.auth', 'abbonamento'])->group(function () {
        Route::get('/film', [FilmController::class, 'index']);
        Route::get('/film/{id}', [FilmController::class, 'show']);
        Route::get('/serie', [SerieController::class, 'index']);
        Route::get('/serie/{id}', [SerieController::class, 'show']);
        Route::get('/episodi/{id}', [EpisodioController::class, 'show']);
    });

    // ───────────────────────────────
    // GESTIONE ERRORI GENERICA
    // ───────────────────────────────
    Route::fallback(function () {
        return response()->json([
            'success' => false,
            'message' => 'Route non trovata.',
        ], 404);
    });
});
