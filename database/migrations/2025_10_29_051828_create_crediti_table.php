<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up(): void
    {
        Schema::create('crediti', function (Blueprint $table) {
            $table->bigIncrements('id');
            $table->unsignedBigInteger('idUtente'); // riferimento alla tabella utenti
            $table->decimal('saldo', 10, 2)->default(0); // saldo disponibile in euro o crediti
            $table->timestamps();

            $table->foreign('idUtente')
                ->references('idUtente')
                ->on('utenti')
                ->onDelete('cascade');
        });
    }

    public function down(): void
    {
        Schema::dropIfExists('crediti');
    }
};
