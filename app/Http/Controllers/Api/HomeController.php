<?php
/**
 * Email: aziz.adel.fci@gmail.com
 * User: aziz
 * Date: 12/13/20
 * Time: 11:10 AM
 */
namespace App\Http\Controllers\Api;


use App\Http\Controllers\Controller;
use TCG\Voyager\Facades\Voyager;

use App\Models\Page;
class HomeController extends Controller {

    public function show()
    {
        $page = Page::where(['id'=>4,"status"=>"ACTIVE"])->with('translations')->first();
        $data = [
            'page' => Helper::page($page),
            'content' => $this->getContent(),
            'sliders' => SliderController::HomeSlider(),
            'home_services' => ServicesController::HomeServices(),
            'testimonials' => TestimonialController::show(),
            'blogs' => BlogController::HomeBlogs(),
            'hospital' => [
                'single_bed' => setting('hospital.single_bed'),
                'doctor' => setting('hospital.doctor'),
                'surgery' => setting('hospital.surgery'),
                'worker' => setting('hospital.worker')
            ],
            'emergency_phone' => setting('contact-us.emergency_number'),

        ];
        return response($data,200);
    }

    public function getContent():array
    {
        $pageContent = [];
        $contents = Page::find(4)->getPageContents()->with('translations')->orderBy('id','ASC')->get();
        foreach ($contents as $k => $content) {
            $pageContent[] = [
                'image'=>Voyager::image($content->image),
                'ar'=>[
                    'title'=>$content->title,
                    'content'=>$content->content,

                ],
                'en'=>Helper::toTranslation($content->translations)
            ];
        }
       return  $pageContent;

    }
}
