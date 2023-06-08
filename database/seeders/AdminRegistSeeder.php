<?php

namespace Database\Seeders;

use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;

class AdminRegistSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {


        DB::table('admins')->insert([
            'first_name'=>'first admin',
            'last_name'=>'ll',
            'email' => "AdminOfSchool22@schoolname.com",
            'password' => bcrypt('100123456'),
        ]);
    }
}
