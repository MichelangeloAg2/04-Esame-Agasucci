<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up(): void
    {
        // Aggiunge colonne ai film
        Schema::table('film', function (Blueprint $table) {
            if (!Schema::hasColumn('film', 'image_path')) {
                $table->string('image_path')->nullable()->after('category_id');
            }
            if (!Schema::hasColumn('film', 'video_path')) {
                $table->string('video_path')->nullable()->after('image_path');
            }
        });

        // Aggiunge colonne alle serie
        Schema::table('serie', function (Blueprint $table) {
            if (!Schema::hasColumn('serie', 'image_path')) {
                $table->string('image_path')->nullable()->after('stagioni');
            }
            if (!Schema::hasColumn('serie', 'video_path')) {
                $table->string('video_path')->nullable()->after('image_path');
            }
        });

        // Aggiunge colonne agli episodi
        Schema::table('episodi', function (Blueprint $table) {
            if (!Schema::hasColumn('episodi', 'image_path')) {
                $table->string('image_path')->nullable()->after('serie_id');
            }
            if (!Schema::hasColumn('episodi', 'video_path')) {
                $table->string('video_path')->nullable()->after('image_path');
            }
        });
    }

    public function down(): void
    {
        Schema::table('film', function (Blueprint $table) {
            $table->dropColumn(['image_path', 'video_path']);
        });

        Schema::table('serie', function (Blueprint $table) {
            $table->dropColumn(['image_path', 'video_path']);
        });

        Schema::table('episodi', function (Blueprint $table) {
            $table->dropColumn(['image_path', 'video_path']);
        });
    }
};
