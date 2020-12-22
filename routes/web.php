<?php

use App\Models\EventCategory;
use App\Models\HakeemMagazine;
use App\Models\ServiceCategory;
use App\Models\ServiceSection;
use App\Models\ServiceSectionItem;
use App\Models\Testimonial;
use App\Models\VideoGallery;
use Illuminate\Support\Facades\App;
use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/
use App\Models\Event;
use App\Models\Service;
use App\Models\Page;

//Route::get('/', \App\Http\Controllers\HomeController::class .'@index');
Route::get('/', function(){

   /* $events = Event::with('translations','categories','timelines')->paginate(2);*/
   /* $categories = EventCategory::with('translations')->get();
    return csrf_token();*/
    //dd(Page::where('id', 2)->get(['image'])[0]);
    //$test = Testimonial::with('translations')->limit(10)->get();

   /* $test->load('translations');*/
    /*foreach ($test as $k=>$item){
       return(__($item['body']));
    }*/

   /* $services =Service::find(2)->with('doctors','translations')->first();
    $doctors = $services->doctors;
    $doctors->load('translations');
    return($services);*/
  /*  $search = \App\Models\Blog::search('بلوج')->get();
    $search->load('translations');
    return $search;*/

    //$page = new Page();
    //$page = Page::where(['id'=>4,"status"=>"ACTIVE"])->with('translations')->first();
    /*foreach ($page->getPageContent as $content) {
        dd($content->pivot->get_page_content);
    }*/
   //$pageContent = $page->get_page_content;

    //$serviceCatogries = ServiceCategory::where('slug','medical-centers')->with('translations')->get();
    //return $serviceCatogries;
    $page =  Page::where('id','=',7)->with('translations')->firstOrFail();
    //$page->load($page);

    return VideoGallery::with('translations')->paginate(10);

});


Route::group(['prefix' => 'moosa-adminstrator'], function () {

    Voyager::routes();
});
