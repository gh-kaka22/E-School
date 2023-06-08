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
            ],
            [
                'name' => "physics",
            ],
            [
                'name' => "sport",
            ]

        ]);
    }
}
