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
        Schema::create('teachers_subjects', function (Blueprint $table) {
            $table->id();
            $table->unsignedbigInteger('teacher_id');
            $table->foreign('teacher_id')->references('teacher_id')->on('teachers')
                ->onUpdate('cascade');
            $table->unsignedbigInteger('subject_id');
            $table->foreign('subject_id')->references('subject_id')->on('subjects')
                ->onUpdate('cascade');
            $table->timestamps();
        });
    }


    public function down(): void
    {
        Schema::dropIfExists('teachers_students');
    }
};
