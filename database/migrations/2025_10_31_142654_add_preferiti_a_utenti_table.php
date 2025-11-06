<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{

    public function up()
    {
        Schema::table('utenti', function (Blueprint $table) {
            $table->json('film_preferiti')->nullable();
            $table->json('serie_preferiti')->nullable();
        });
    }

    public function down()
    {
        Schema::table('utenti', function (Blueprint $table) {
            $table->dropColumn(['film_preferiti', 'serie_preferiti', 'abbonamento_attivo']);
        });
    }
};
