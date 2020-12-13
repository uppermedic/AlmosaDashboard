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

use TCG\Voyager\Models\Page;
class HomeController extends Controller {

    public function show()
    {
        $data = [
            'header'=>Helper::header(),
            'page_cover'=>Voyager::image(Page::where('id',2)->get(['image'])[0]['image']),
            'home_services'=>ServicesController::HomeServices(),
            'testimonials'=>TestimonialController::show(),
            'hospital'=>[
                'single_bed'=>setting('hospital.single_bed'),
                'doctor'=>setting('hospital.doctor'),
                'surgery'=>setting('hospital.surgery'),
                'patient'=>setting('hospital.patients')
            ],
            'emergency_phone'=>setting('contact-us.emergency_number'),
            'footer'=>Helper::footer()
        ];
        return response($data,200);
    }
}