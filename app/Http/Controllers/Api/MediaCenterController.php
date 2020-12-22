<?php
/**
 * created by aziz(aziz.adel.fci@gmail.com)
 **/
namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Models\HakeemMagazine;
use App\Models\Page;
use App\Models\PhotoCategory;
use App\Models\VideoGallery;
use TCG\Voyager\Facades\Voyager;


class MediaCenterController extends Controller
{
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

        $articles = HakeemMagazine::with('translations')->paginate(1);
        $data = [];
        $data['current_page']= $articles->currentPage();
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

    public function getVideos()
    {
        $videos = VideoGallery::with('translations')->paginate(10);
        $data = [];
        $data['current_page']= $videos->currentPage();
        $data['previous_page_url'] = $videos->previousPageUrl();
        $data['next_page_url'] = $videos->nextPageUrl();
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

    public function getPhotos()
    {
        $photos = PhotoCategory::all();
        foreach ($photos as $photo) {
            return $photo->getPhotos['images'];
        }
        return $photos;
    }
}
