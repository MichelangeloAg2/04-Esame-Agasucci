<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up(): void
    {
        Schema::create('serie', function (Blueprint $table) {
            $table->engine = 'InnoDB';

            $table->id();
            $table->string('titolo');
            $table->text('descrizione')->nullable();
            $table->year('anno_inizio')->nullable();
            $table->year('anno_fine')->nullable();
            $table->integer('stagioni')->nullable();
            $table->string('regista')->nullable();

            // relazione con categorie
            $table->foreignId('category_id')
                ->constrained('categories')
                ->onDelete('cascade');

            $table->timestamps();
        });
    }

    public function down(): void
    {
        Schema::dropIfExists('serie');
    }
};
