<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{

    public function up(): void
    {
        Schema::create('students_comments', function (Blueprint $table) {
            $table->id();
            $table->unsignedbigInteger('student_id');
            $table->foreign('student_id')->references('student_id')->on('students')
                ->onUpdate('cascade')
                ->onDelete('cascade');
            $table->unsignedbigInteger('post_id');
            $table->foreign('post_id')->references('post_id')->on('posts')
                ->onUpdate('cascade')
                ->onDelete('cascade');
            $table->text('body');
            $table->timestamps();
        });
    }




    public function down(): void
    {
        Schema::dropIfExists('students_comments');
    }
};
