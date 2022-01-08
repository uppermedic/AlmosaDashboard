<?php


use App\Http\Controllers\Api\AcademicTeamController;
use App\Http\Controllers\Api\SectionController;
use App\Http\Controllers\Api\ContactUsController;
use App\Http\Controllers\Api\BlogController;
use App\Http\Controllers\Api\CommunityController;
use App\Http\Controllers\Api\DoctorController;
use App\Http\Controllers\Api\MediaCenterController;
use App\Models\Testimonial;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\App;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\Api\HistoryController;
use App\Http\Controllers\Api\HomeController;
use App\Http\Controllers\Api\LayoutController;
use App\Http\Controllers\Api\SearchController;
use App\Http\Controllers\Api\PageController;
use App\Http\Controllers\Api\AboutController;
use App\Http\Controllers\Api\ServicesController;
use App\Http\Controllers\Api\EventController;

Route::prefix('v1')->group(function () {
    Route::post('/page-item', PageController::class . '@storePageItem');
    Route::get('/layout', LayoutController::class . '@show');
    Route::get('/', HomeController::class . '@show');
    Route::get('/home', HomeController::class . '@show');
    Route::get('/page/{id}', PageController::class . '@show');
    Route::get('/page-item/{page_item}', PageController::class . '@showPageItem');
    Route::get('/about', AboutController::class . '@show');

    Route::get('/contact', ContactUsController::class . '@show');
    Route::post('/contact', ContactUsController::class . '@ContactUs');

    Route::get('/history', HistoryController::class . '@show');
    Route::prefix('services')->group(function () {
        Route::get('/', ServicesController::class . '@show');
        Route::get('/{cat_id}', ServicesController::class . '@servicesByCategory');
        Route::get('/single/{service_id}', ServicesController::class . '@singleService');

    });

    Route::prefix('education')->group(function () {
        Route::get('/', EventController::class . '@show');

        Route::get('/type/{type}', EventController::class . '@getEventsOrCourses');

        Route::post('/filter/{type}', EventController::class . '@filtration');

        Route::get('/categories', EventController::class . '@getEventCategories');

        Route::get('/single/{event_id}', EventController::class . '@getSingleEvent');

        Route::get('/academic/team', AcademicTeamController::class . '@getTeam');

        Route::post('/register', EventController::class . '@registerToEvent')->middleware('checkEvent');

    });

    Route::prefix('media')->group(function () {
        Route::get('/', MediaCenterController::class . '@show');
        Route::get('/magazine', MediaCenterController::class . '@getMagazine');

        Route::prefix('videos')->group(function () {
            Route::get('/', MediaCenterController::class . '@getVideos');
            //Route::get('/{categoryID?}',MediaCenterController::class.'@getVideos');
            Route::get('/categories', MediaCenterController::class . '@getVideosCategory');
        });

        Route::prefix('photos')->group(function () {
            Route::get('/', MediaCenterController::class . '@getPhotos');
            Route::get('/categories', MediaCenterController::class . '@getPhotosCategory');
        });

    });
    Route::prefix('doctors')->group(function () {

        Route::get('/', DoctorController::class . '@show');
        Route::get('/{id}', DoctorController::class . '@getDoctor');
        Route::get('/filter/id={section_id}', DoctorController::class . '@filter');

    });

    Route::get('/sections', SectionController::class . '@show');

    Route::prefix('blog')->group(function () {
        Route::get('/', BlogController::class . '@show');
        Route::get('/medical-article', BlogController::class . '@medicalArticle');
        Route::get('/tags', BlogController::class . '@getTags');
        Route::get('/categories', BlogController::class . '@getCategories');

        Route::prefix('articles')->group(function () {
            Route::get('/', BlogController::class . '@getArticles');
            Route::get('/find/{text}', BlogController::class . '@searchInArticles');
            Route::get('/single/{article_id}', BlogController::class . '@getSingleArticle');
            Route::get('/cats={cats}/tags={tags}', BlogController::class . '@articlesFilter');

        });
    });

    Route::prefix('community')->group(function () {
        Route::get('/', CommunityController::class . '@show');
        Route::get('/{id}', CommunityController::class . '@getCommunity');
    });

    Route::get('/search/{q}', SearchController::class . '@show');
    Route::get('/all/search', SearchController::class . '@all');

    Route::fallback(function () {
        return response()->json([
            'message' => 'Page Not Found. 404 Error!'], 404);
    });

});
// version 2
Route::prefix('v2')->group(function () {
    Route::get('/layout', LayoutController::class . '@show');
    Route::get('/', HomeController::class . '@show');
    Route::get('/home', HomeController::class . '@show');
    Route::get('/about', AboutController::class . '@show');

    Route::prefix('services')->group(function () {
        Route::get('/', ServicesController::class . '@show');
        Route::get('/{cat_id}', ServicesController::class . '@servicesByCategory');
        Route::get('/single/{service_id}', ServicesController::class . '@singleService');

    });

    Route::prefix('education')->group(function () {
        Route::get('/', EventController::class . '@show');

        Route::get('/type/{type}', EventController::class . '@getEventsOrCourses');

        Route::post('/filter/{type}', EventController::class . '@filtration');

        Route::get('/categories', EventController::class . '@getEventCategories');

        Route::get('/single/{event_id}', EventController::class . '@getSingleEvent');

        Route::post('/register', EventController::class . '@registerToEvent')->middleware('checkEvent');

    });

    Route::prefix('media')->group(function () {
        Route::get('/', MediaCenterController::class . '@show');
        Route::get('/magazine', MediaCenterController::class . '@getMagazine');

        Route::prefix('videos')->group(function () {
            Route::get('/', MediaCenterController::class . '@getVideos');
            //Route::get('/{categoryID?}',MediaCenterController::class.'@getVideos');
            Route::get('/categories', MediaCenterController::class . '@getVideosCategory');
        });

        Route::prefix('photos')->group(function () {
            Route::get('/', MediaCenterController::class . '@getPhotos');
            Route::get('/categories', MediaCenterController::class . '@getPhotosCategory');
        });

    });

    Route::get('/doctors', DoctorController::class . '@show');


    Route::prefix('blog')->group(function () {
        Route::get('/', BlogController::class . '@show');
        Route::get('/tags', BlogController::class . '@getTags');
        Route::get('/categories', BlogController::class . '@getCategories');

        Route::prefix('articles')->group(function () {
            Route::get('/', BlogController::class . '@getArticles');
            Route::get('/cats={cats}/tags={tags}', BlogController::class . '@articlesFilter');

        });
    });

    Route::prefix('community')->group(function () {
        Route::get('/', CommunityController::class . '@show');
        Route::get('/{id}', CommunityController::class . '@getCommunity');
    });

    Route::get('/search/{q}', SearchController::class . '@show');

    Route::fallback(function () {
        return response()->json([
            'message' => 'Page Not Found. 404 Error!'], 404);
    });
});
