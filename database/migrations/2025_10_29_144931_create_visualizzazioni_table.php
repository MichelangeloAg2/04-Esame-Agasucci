<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up(): void
    {
        Schema::create('visualizzazioni', function (Blueprint $table) {
            $table->bigIncrements('id');
            $table->unsignedBigInteger('utente_id');
            $table->unsignedBigInteger('film_id')->nullable();
            $table->unsignedBigInteger('episodio_id')->nullable();
            $table->integer('secondi_guardati')->default(0);
            $table->timestamp('data_ultima_visione')->useCurrent();
            $table->boolean('completato')->default(false);
            $table->timestamps();

            $table->foreign('utente_id')->references('idUtente')->on('utenti')->onDelete('cascade');
            $table->foreign('film_id')->references('id')->on('film')->onDelete('cascade');
            $table->foreign('episodio_id')->references('id')->on('episodi')->onDelete('cascade');
        });
    }

    public function down(): void
    {
        Schema::dropIfExists('visualizzazioni');
    }
};
