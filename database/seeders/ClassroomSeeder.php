<?php

namespace Database\Seeders;

use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;

class ClassroomSeeder extends Seeder
{

    public function run(): void
    {
        DB::table('classrooms')->insert([
            [
                'capacity' => 35,
                'room_number' => "A5",
                'grade_id'=>1,
            ],
            [
                'capacity' => 35,
                'room_number' => "A6",
                'grade_id'=>1,
            ],


        ]);
    }

}
