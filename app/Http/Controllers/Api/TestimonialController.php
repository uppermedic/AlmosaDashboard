<?php
/**
 * Email: aziz.adel.fci@gmail.com
 * User: aziz
 * Date: 12/13/20
 * Time: 2:25 PM
 */
namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Models\Testimonial;

class TestimonialController extends Controller {

    public static function show()
    {
        $tests = Testimonial::with('translations')->orderBy('id','DESC')->limit(10)->get();
        $items = [];
        foreach ($tests as $key=>$item){
            $items[] =[
                'ar'=>[
                    'body'=>$item['body'],
                    'patient_name'=>$item['patient_name'],
                    'dr_name'=>$item['dr_name'],
                    'department'=>$item['department'],
                ],
                'en'=> Helper::toTranslation($item['translations'])
            ];

        }
        return $items;
    }


}