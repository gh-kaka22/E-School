<?php

namespace Database\Seeders;

use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;

class PostTypeSeeder extends Seeder
{

    public function run(): void
    {
        DB::table('posts_type')->insert([
            [
                'name' => "اخبارية",
            ],
            [
                'name' => "سلوكية",
            ],


        ]);
    }
}
