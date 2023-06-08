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
        Schema::create('students_parents', function (Blueprint $table) {
            $table->id();
            $table->unsignedbigInteger('student_id');
            $table->unsignedbigInteger('parent_id');
            $table->foreign('student_id')->references('student_id')->on('students')
                ->onUpdate('cascade')
                ->onDelete('cascade');
            $table->foreign('parent_id')->references('parent_id')->on('parents')
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
        Schema::dropIfExists('students_parents');
    }
};
