<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateUtentiTable extends Migration
{
    /**
     * Run the migrations.
     */
    public function up(): void
    {
        Schema::create('utenti', function (Blueprint $table) {
            $table->bigIncrements('idUtente'); // chiave primaria con nome personalizzato
            $table->string('nome', 40)->nullable();
            $table->string('cognome', 40)->nullable();
            $table->unsignedTinyInteger('sesso')->nullable();
            $table->string('email', 100)->unique();
            $table->string('password', 255);
            $table->enum('ruolo', ['admin', 'user', 'guest'])->default('guest');
            $table->decimal('crediti', 10, 2)->default(0);
            $table->boolean('abbonamento_attivo')->default(false);
            $table->rememberToken();
            $table->softDeletes();
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('utenti');
    }
}
