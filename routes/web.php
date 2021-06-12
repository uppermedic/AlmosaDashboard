<?php

/*use App\Models\Blog;
use App\Models\Community;
use App\Models\EventCategory;
use App\Models\HakeemMagazine;
use App\Models\ServiceCategory;
use App\Models\ServiceSection;
use App\Models\ServiceSectionItem;
use App\Models\Testimonial;
use App\Models\VideoGallery;
use Illuminate\Support\Facades\App;
use Illuminate\Support\Facades\Route;
*/
/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*//*
use App\Models\Event;
use App\Models\Service;
use App\Models\Page;
*/
//Route::get('/', \App\Http\Controllers\HomeController::class .'@index');
//Route::get('/', function(){

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
    //$page =  Page::where('id','=',7)->with('translations')->firstOrFail();
    //$page->load($page);

   /*$articles =  Blog::whereHas('categories',function ($q){
       $q->where('slug','LIKE',['blog-category_2']);
   })->orWhereHas('tags',function ($q){
       $q->where('tag_name','LIKE',['الصحة']);
   })->with('tags','categories','translations')->orderBy('id','DESC')->paginate(10);*/
   /* $com =  Community::all();
    $content = $com->contents;
    return $content;*/
    /*return json_encode($content->photos) ;*/
    //return \TCG\Voyager\Facades\Voyager::image($com->photos[0]);
   /* foreach ($images as $image) {
        echo $image;
    }*/
    //$images = \App\Models\PhotoGallery::where('photo_category_id',1)->get();
    /*foreach ($images as $image) {
        return $image->category->where('id',1);
    }*/
   // return $images;
  //  $user = \App\Models\EventAttendance::find(9);
   // return new \App\Mail\EventRegistered($user);
//return view('welcome');
//});


//Route::group(['prefix' => '/'], function () {
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\AjaxController;
use TCG\Voyager\Voyager;

Auth::routes();

Route::post('/getSections', [AjaxController::class, 'getSections']);
Route::post('/addNewSection', [AjaxController::class, 'addNewSection']);
Route::post('/updateSortingList', [AjaxController::class, 'updateSortingList']);

(new TCG\Voyager\Voyager)->routes();
//});
