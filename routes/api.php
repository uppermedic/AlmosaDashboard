<?php

use App\Models\Testimonial;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\App;
use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/
use App\Http\Controllers\Api\HomeController;
use App\Http\Controllers\Api\LayoutController;
use App\Http\Controllers\Api\SearchController;
use App\Http\Controllers\Api\AboutController;
use App\Http\Controllers\Api\ServicesController;
use App\Http\Controllers\Api\EventController;
/*Route::middleware('auth:api')->get('/user', function (Request $request) {
    return $request->user();
});*/

/*Route::get('/home/testimonials', function () {
    App::setLocale('en');
    $test = menu('admin');
    $test->load('translations');
    return $test;
});*/
Route::get('/layout',LayoutController::class.'@show');
Route::get('/home',HomeController::class.'@show');
Route::get('/about', AboutController::class . '@show');

Route::prefix('services')->group(function (){
    Route::get('/',ServicesController::class.'@show');
    Route::get('/{cat_id}',ServicesController::class.'@servicesByCategory');
    Route::get('/single/{service_id}',ServicesController::class.'@singleService');

});

Route::prefix('education')->group(function (){
    Route::get('/',EventController::class.'@show');

    Route::get('/type/{type}',EventController::class.'@getEventsOrCourses');

    Route::post('/filter/{type}',EventController::class.'@filtration');

    Route::get('/categories',EventController::class.'@getEventCategories');

    Route::get('/single/{event_id}',EventController::class.'@getSingleEvent');

    Route::post('/register',EventController::class.'@registerToEvent')->middleware('checkEvent');

});


Route::get('/search/{q}',SearchController::class.'@show');
