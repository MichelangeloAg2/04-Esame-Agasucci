<?php

use Illuminate\Support\Facades\Route;

Route::get('/api/test', function () {
    return response()->json(['message' => 'API funzionante']);
});
Route::get('/', fn() => response()->json(['message' => 'ok']));
