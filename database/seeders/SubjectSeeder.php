<?php

namespace Database\Seeders;

use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;

class SubjectSeeder extends Seeder
{

    public function run(): void
    {
        DB::table('subjects')->insert([
            [
                'name' => "none",
                'max_mark'=>0
            ],
            [
                'name' => "physics",
                'max_mark'=>400
            ],
            [
                'name' => "sport",
                'max_mark'=>200
            ]

        ]);
    }
}