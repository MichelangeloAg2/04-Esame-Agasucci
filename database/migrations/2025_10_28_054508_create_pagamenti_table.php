<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up(): void
    {
        Schema::create('pagamenti', function (Blueprint $table) {
            $table->bigIncrements('id');
            $table->unsignedBigInteger('idUtente');
            $table->string('metodo_pagamento', 100);
            $table->string('numero_carta', 20)->nullable();
            $table->date('scadenza')->nullable();
            $table->string('cvv', 5)->nullable();
            $table->boolean('predefinita')->default(false);
            $table->timestamps();

            $table->foreign('idUtente')
                ->references('idUtente')
                ->on('utenti')
                ->onDelete('cascade')
                ->onUpdate('cascade');
        });
    }

    public function down(): void
    {
        Schema::dropIfExists('pagamenti');
    }
};
