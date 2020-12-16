<?php

use App\Models\ServiceCategory;
use App\Models\Testimonial;
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

   /* $events = Event::with('categories','timelines')->get();
    $events->load('translations');
    return $events;*/
    //dd(Page::where('id', 2)->get(['image'])[0]);
    //$test = Testimonial::with('translations')->limit(10)->get();

   /* $test->load('translations');*/
    /*foreach ($test as $k=>$item){
       return(__($item['body']));
    }*/

//    $services = Service::with('translations')->get();
//    return($services);
  /*  $search = \App\Models\Blog::search('بلوج')->get();
    $search->load('translations');
    return $search;*/

    //$page = new Page();
    //$page = Page::where(['id'=>4,"status"=>"ACTIVE"])->with('translations')->first();
    /*foreach ($page->getPageContent as $content) {
        dd($content->pivot->get_page_content);
    }*/
   //$pageContent = $page->get_page_content;

    $serviceCatogries = ServiceCategory::with('translations')->get();
    return $serviceCatogries;

});


Route::group(['prefix' => 'moosa-adminstrator'], function () {

    Voyager::routes();
});
