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
        DB::table('schools')->insert([

            [
                'name' => 'School Name',
                'address' => "Damascus-Mazzeh-Near Al-Jalaa Stadium",
                'overview'=>"Our school's mission is to learn leadership, the common core, and relationships for life. Our mission is to provide a safe, disciplined learning environment that empowers all students to develop their full potential. We feel strongly about helping to build leaders that have the ability to succeed in whatever endeavor they undertake. Winning is not always the measure of success. Our students understand the 'Win, win' philosophy and use it in their daily life.",
                'phone'=> '+963912345678'
            ]

        ]);
    }
}
