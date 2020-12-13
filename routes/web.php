<?php

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
use TCG\Voyager\Models\Page;

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

    $services = Service::with('translations')->get();
    return($services);
    
});


Route::group(['prefix' => 'moosa-adminstrator'], function () {
    
    Voyager::routes();
});
