<?php

namespace Database\Seeders;

use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;

class OwnerFirstAcc extends Seeder
{
    /**
     * Run the database seeds.
     */

    public function run(): void
    {
        //
        DB::table('owners')->insert([
            'email' => "OwnerOfSchool22@gmail.com",
            'password' => bcrypt('100Password1@2'),
        ]);
    }

}
