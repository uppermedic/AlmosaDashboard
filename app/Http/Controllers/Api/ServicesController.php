<?php
/**
 * Email: aziz.adel.fci@gmail.com
 * User: aziz
 * Date: 12/13/20
 * Time: 3:21 PM
 */
namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Models\Service;
use TCG\Voyager\Facades\Voyager;

class ServicesController extends Controller
{
    /**
     * show services at home page  limit by 10
     */
    public static function HomeServices()
    {
        $services = Service::where('service_category_id',2)->with('translations')->orderBy('id','DESC')->limit(10)->get();
        $items = [];
        foreach ($services as $key => $service) {
            $items[]=[
                'ar'=>[
                    'slug'=>$service['slug'],
                    'title'=>$service['title'],
                    'excerpt'=>$service['excerpt'],
                    'thumbnail'=>Voyager::image($service['thumbnail']),
                ],
                'en'=>Helper::toTranslation($service['translations']),
            ];
        }
        return $items;
    }
}