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
        Schema::create('parents_likes', function (Blueprint $table) {
            $table->id();

            $table->unsignedbigInteger('parent_id');
            $table->foreign('parent_id')->references('parent_id')->on('parents')
                ->onUpdate('cascade')
                ->onDelete('cascade');

            $table->unsignedbigInteger('post_id');
            $table->foreign('post_id')->references('post_id')->on('posts')
                ->onUpdate('cascade')
                ->onDelete('cascade');
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('parents_likes');
    }
};
