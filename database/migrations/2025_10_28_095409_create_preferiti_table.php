<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up(): void
    {
        Schema::create('preferiti', function (Blueprint $table) {
            $table->id();

            // Colonna utente
            $table->unsignedBigInteger('idUtente');
            $table->foreign('idUtente')->references('idUtente')->on('utenti')->onDelete('cascade');
            $table->unsignedBigInteger('film_id')->nullable();
            $table->unsignedBigInteger('serie_id')->nullable();
            $table->timestamps();
        });
    }

    public function down(): void
    {
        Schema::dropIfExists('preferiti');
    }
};
