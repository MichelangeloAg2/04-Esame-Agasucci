<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up(): void
    {
        Schema::create('episodi', function (Blueprint $table) {
            $table->id();
            $table->string('titolo');
            $table->integer('numero_episodio');
            $table->integer('stagione');
            $table->text('descrizione')->nullable();
            $table->date('data_uscita')->nullable();
            $table->foreignId('serie_id')->constrained('serie')->onDelete('cascade');
            $table->timestamps();
        });
    }

    public function down(): void
    {
        Schema::dropIfExists('episodi');
    }
};
