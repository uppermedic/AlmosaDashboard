<?php

namespace Database\Factories;

use App\Models\Doctor;
use Illuminate\Database\Eloquent\Factories\Factory;
use Faker\Generator as Faker;
class DoctorFactory extends Factory
{
    /**
     * The name of the factory's corresponding model.
     *
     * @var string
     */
    protected $model = Doctor::class;

    /**
     * Define the model's default state.
     *
     * @return array
     */
    public function definition()
    {
        $faker = new Faker();
        return [
            /* 'slug'=>str_replace('--', '-', strtolower(preg_replace('/[^a-zA-Z0-9]/', '-', trim($faker->sentence(5))))),
            'name'=>$faker->sentence(5),
            'title'=>$faker->sentence(10),
            'qualifications'=>,
            'current_positions'=>'',
            'facebook'=>'',
            'twitter'=>'',
            'linkedin'=>'',
            'website_url'=>'',
            'whatsapp_number'=>'',
            'image'=>'', */
        ];
    }
}
