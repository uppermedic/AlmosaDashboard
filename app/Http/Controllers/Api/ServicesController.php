<?php
/**
 * Email: aziz.adel.fci@gmail.com
 * User: aziz
 * Date: 12/13/20
 * Time: 3:21 PM
 */
namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Models\Page;
use App\Models\Service;
use App\Models\ServiceCategory;
use TCG\Voyager\Facades\Voyager;

class ServicesController extends Controller
{

    public function show()
    {
        $page = Page::where(['id' => 5, 'status' => 'ACTIVE'])->with('translations')->first();
        return response([
            'page' => Helper::page($page),
            'categories'=>$this->getCategories(),

        ],200);
    }

    /**
     * show services at home page  limit by 10
     */
    public static function HomeServices(): array
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

    public function getCategories():array
    {
        $data = [];
        $categories = ServiceCategory::with('translations')->get();
        foreach ($categories as $category) {
            $data [] = [
                'id'=>$category->id,
                'color'=>$category->color,
                'thumbnail'=>Voyager::image($category->thumbnail),
                'ar' => [
                    'title'=>$category->title,
                    'slug'=>$category->slug
                ],
                'en'=>Helper::toTranslation($category->translations)
            ];
        }
        return $data;
    }
}
