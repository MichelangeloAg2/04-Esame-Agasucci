<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
    public function up(): void
    {
        Schema::create('carte', function (Blueprint $table) {
            $table->id();
            $table->string('numero', 16);
            $table->string('cvv', 4);
            $table->date('scadenza');
            $table->enum('metodo_pagamento', ['carta_credito', 'carta_debito'])->default('carta_credito');

            // Collegamento alla tabella utenti
            $table->unsignedBigInteger('utente_id');
            $table->foreign('utente_id')
                ->references('idUtente') // <-- attenzione qui
                ->on('utenti')
                ->onDelete('cascade');

            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('carte');
    }
};
