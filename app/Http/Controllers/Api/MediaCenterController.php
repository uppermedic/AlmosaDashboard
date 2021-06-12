<?php
/**
 * created by aziz(aziz.adel.fci@gmail.com)
 **/
namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Models\HakeemMagazine;
use App\Models\Page;
use App\Models\PhotoCategory;
use App\Models\PhotoGallery;
use App\Models\VideoCategory;
use App\Models\VideoGallery;
use TCG\Voyager\Facades\Voyager;


class MediaCenterController extends Controller
{
    /*
     * get page settings
     */
    public function show()
    {
        $page = Page::where('id','=',7)->with('translations')->firstOrFail();
        $data['page'] =  Helper::page($page);
        return response($data,200);
    }

    /**
     * @return \Illuminate\Contracts\Foundation\Application|\Illuminate\Contracts\Routing\ResponseFactory|\Illuminate\Http\Response
     */
    public function getMagazine()
    {

        $articles = HakeemMagazine::with('translations')->paginate(12);
        $data = [];
        $data['current_page']= $articles->currentPage();
	$data['last_page']   = $articles->lastPage();
        $data['previous_page_url'] = $articles->previousPageUrl();
        $data['next_page_url'] = $articles->nextPageUrl();
        $data['data']=[];
        foreach ($articles->items() as $article) {
            array_push($data['data'], [
                'image' => Voyager::image($article->image),
                'url' => $article->url,
                'ar'=>[
                    'title' => $article->title,

                ],
                'en'=>Helper::toTranslation($article->translations,['title']),

            ]);
        }
        return response($data, 200);
    }

    /*
     * get videos paginated by categories
     */
    public function getVideos()
    {
        if (request()->has('category')) {
            $videos = VideoGallery::where('video_category_id','=',request()->get('category'))->with('translations')->paginate(10);
        }else
        {
            $videos = VideoGallery::with('translations')->paginate(10);
        }

        $data = [];
        $data['current_page']= $videos->currentPage();
        $data['previous_page_url'] = $videos->previousPageUrl();
        $data['next_page_url'] = $videos->nextPageUrl();
	$data['last_page'] = $videos->lastPage();
        $data['data']=[];
        foreach ($videos->items() as $article) {
            array_push($data['data'], [
                'image' => Voyager::image($article->bg_image),
                'url' => $article->video_url,
                'ar'=>[
                    'title' => $article->title,

                ],
                'en'=>Helper::toTranslation($article->translations,['title']),

            ]);
        }
        return response($data, 200);
    }
    /*
     * get video categories
     */
    public function getVideosCategory()
    {
        $data = [];
        $categories = VideoCategory::with('translations')->get();
        foreach ($categories as $category) {
            array_push($data, [
                'id' => $category->id,
                'ar' => [
                    'title' => $category->title,

                ],
                'en' => Helper::toTranslation($category->translations),

            ]);
        }
        return response($data, 200);
    }

    /**
     *
     * get all photos gallery with custom pagination
     * get photos by category id
     */
    public function getPhotos()
    {
        $categoryID = request()->get('category');
        $pageNumber = request()->get('page');
        $data = [];
        if (!empty($categoryID)) {
            $photos = PhotoGallery::where('photo_category_id',$categoryID)->get();
        }else{
            $photos = PhotoGallery::all();
        }

        foreach ($photos as $photo) {

           /* return$photo->images;*/
            foreach ($this->getSecretImages($photo->images) as $image){
                array_push($data, $image);
            }

        }
        $data = array_chunk($data, 20);

        $images = [];
        $images['images'] = (!empty($pageNumber) and $pageNumber != 0)? $data[$pageNumber -1]:$data[0];
        $images['last_page'] = count($data);
        return response($images, 200);
    }

    /*
     *
     * get the categories of photos
     */
    public function getPhotosCategory()
    {
$categories = PhotoCategory::with('translations')->get();
        $data = [];
        foreach ($categories as $category) {
            array_push($data, [
                'id'=>$category->id,
                'ar'=>[
                    'title'=>$category->title
                ],
                'en'=>Helper::toTranslation($category->translations)
            ]);
        }
        return response($data,200);
    }

    /*
     *  return images seperated
     */
    protected function getSecretImages($images):array
    {
        $data = [];
        foreach (json_decode($images) as $item) {
            array_push($data,Voyager::image($item));
        }
        return $data;
    }
}
