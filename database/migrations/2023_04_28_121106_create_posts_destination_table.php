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
        Schema::create('posts_destination', function (Blueprint $table) {
            $table->id();
            $table->unsignedbigInteger('student_id');
            $table->foreign('student_id')->references('student_id')->on('students')
                ->onUpdate('cascade');
            $table->unsignedbigInteger('post_id');
            $table->foreign('post_id')->references('post_id')->on('posts')
                ->onUpdate('cascade');

            //$table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('posts_destination');
    }
};
