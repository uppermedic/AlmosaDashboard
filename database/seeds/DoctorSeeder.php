<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;

class DoctorSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        DB::table('doctors')->insert([
            'slug'=>'',
            'name'=>'',
            'title'=>'',
            'qualifications'=>'',
            'current_positions'=>'',
            'facebook'=>'',
            'twitter'=>'',
            'linkedin'=>'',
            'website_url'=>'',
            'whatsapp_number'=>'',
            'image'=>'',
        ]);
    }
}
