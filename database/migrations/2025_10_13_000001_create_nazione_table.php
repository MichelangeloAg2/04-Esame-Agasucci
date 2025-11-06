<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration {
    public function up(): void
    {
        Schema::create('nazioni', function (Blueprint $table) {
            $table->id('idNazione');
            $table->string('nome', 100);
            $table->string('iso', 3)->nullable();
            $table->string('iso3', 3)->nullable();
            $table->string('prefissoTelefonisco', 10)->nullable(); // o prefissoTelefonico
            $table->timestamps();
        });
    }

    public function down(): void
    {
        Schema::dropIfExists('nazioni');
    }
};
