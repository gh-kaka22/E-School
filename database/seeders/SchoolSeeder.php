<?php

namespace Database\Seeders;

use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;

class SchoolSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        DB::table('classrooms')->insert([

            [
                'name' => 'School Name',
                'address' => "Mazzeh",
                'overview'=>"the best school in the world",
                'phone'=> '0912345678'
            ]

        ]);
    }
}
