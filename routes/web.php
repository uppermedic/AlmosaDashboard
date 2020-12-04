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
//Route::get('/', \App\Http\Controllers\HomeController::class .'@index');
Route::get('/', function(){
   
    $events = Event::with('categories','timelines')->get();
    $events->load('translations');
    return $events;

    
});


Route::group(['prefix' => 'moosa-adminstrator'], function () {
    
    Voyager::routes();
});
