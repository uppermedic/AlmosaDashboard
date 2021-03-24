<?php
/**
 * Email: aziz.adel.fci@gmail.com
 * User: aziz
 * Date: 12/13/20
 * Time: 3:21 PM
 */
namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Models\Doctor;
use App\Models\Page;
use App\Models\Service;
use App\Models\ServiceCategory;
use App\Models\ServiceSection;
use App\Models\ServiceSectionItem;
use TCG\Voyager\Facades\Voyager;

class ServicesController extends Controller
{

    /**
     * show categories in services page
     * @return \Illuminate\Contracts\Foundation\Application|\Illuminate\Contracts\Routing\ResponseFactory|\Illuminate\Http\Response
     */
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
        $services = Service::where('service_category_id',2)->inRandomOrder()->with('translations')->limit(6)->get();
        $items = [];
        foreach ($services as $key => $service) {
            $items[]=[
		'id'=>$service['id'],
                'ar'=>[
			'thumbnail'=>Voyager::image($service['thumbnail']),

                    'slug'=>$service['slug'],
                    'title'=>$service['title'],
                    'excerpt'=>$service['excerpt'],
                ],
                'en'=>Helper::toTranslation($service['translations'],['slug','title','excerpt']),
            ];
        }
        return $items;
    }

    /**
     * get service categories [services page ]
     * @return array
     */
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

    /**
     * get all services by category id
     * @param $cat_id
     * @return \Illuminate\Contracts\Foundation\Application|\Illuminate\Contracts\Routing\ResponseFactory|\Illuminate\Http\Response
     */
    public function servicesByCategory($cat_id)
    {
        $data = [];
        $services = Service::where('service_category_id', $cat_id)->with('translations')->get();
        if(is_null($services)){
	return response([
        'status' => 'ERROR',
        'error' => '404 not found'
    ], 404);
	}
	$data['services'] = [];
        foreach ($services as $k => $service) {
            $data['page_cover']= Voyager::image(ServiceCategory::where('id',$service->service_category_id)->first('image')->image);
            array_push($data['services'] , [
		'thumbnail'=> Voyager::image($service->thumbnail),
                'icon'=>Voyager::image($service->icon),
                'color'=>$service->color,
                'id'=>$service->id,
                'ar'=>[
                    'title'=>$service->title,
                    'excerpt'=>$service->excerpt
                ],
                'en'=>Helper::toTranslation($service->translations,['title','excerpt'])
            ]);
        }
        return response($data, 200);
    }

    public function singleService($service_id)
    {
        $data = [];
        try{
            $service = Service::whereId($service_id)->with('translations')->first();
            //if(is_null($service)) return response(['status'=>'ERROR','error'=>''],401) ;
        } 
            catch (\Illuminate\Database\Eloquent\ModelNotFoundException $e) {
                        return response([
                            'status' => 'ERROR',
                            'error' => '404 not found'
                        ], 404);
                   }

	$data['id']  = $service->id;
        $data['icon']= Voyager::image($service->icon);
        $data['thumbnail']= Voyager::image($service->thumbnail);
        $data['image']= Voyager::image($service->image);
        $data['image2']= Voyager::image($service->image2);
        $data['seo']=[
        'ar'=>[
                'slug'=>$service->slug,
                'title'=>$service->title,
                'excerpt'=>$service->excerpt,
                'content'=>$service->content,
            'content2'=>$service->content2
            ],
        'en'=>Helper::toTranslation($service->translations,['slug','title','excerpt','content','content2'])
        ];
        $data['sections']= $this->getServiceSections($service->id);
        $data['physicians'] = $this->getServiceDoctors($service);


        return response($data,200);
    }

    public function getServiceSections($id): array
    {
        $sections = ServiceSection::where('service_id', $id)->with('translations')->get();
        $data = [];
        foreach ($sections as $section) {
            $data[] = [
                'id'=>$section->id,
                'icon'=>Voyager::image($section->icon),
                'color'=>$section->color,
                'ar'=>[
                    'title'=>$section->title
                ],
                'en'=>Helper::toTranslation($section->translations,['title']),
                'items'=>$this->sectionItems($section->id),

            ];
        }
        return $data;
    }

    public function sectionItems($id): array
    {
        $data = [];
        $items = ServiceSectionItem::where('section_id', $id)->with('translations')->get();
        foreach ($items as $item) {
            $data[] = [
                'ar'=>[
                    'title'=>$item->title,
                    'content'=>$item->content
                ],
                'en'=>Helper::toTranslation($item->translations),
		'video_url'=>$item->video_url,
            ];
        }
        return $data;
    }
    public function getServiceDoctors($service): array
    {
        $data = [];
        $doctors = $service->doctors;
        $doctors->load('translations');
        foreach ($doctors as $doctor) {
            $data[] = [

                'image' => Voyager::image($doctor->image),
                'id' => $doctor->id,
                'ar'=>[
                    'name' => $doctor->name,
                    'title' => $doctor->title,
                ],
                'en'=>Helper::toTranslation($doctor->translations,['name','title'])
            ];
        }
        return $data;

    }
}
