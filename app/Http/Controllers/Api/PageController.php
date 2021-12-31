<?php
/**
 * created by aziz(aziz.adel.fci@gmail.com)
 **/
namespace App\Http\Controllers\Api;
use App\Http\Controllers\Controller;
use App\Models\Page;
use TCG\Voyager\Facades\Voyager;

class PageController extends Controller
{
    public function show($id)
    {
        $page = Page::where(['id'=>$id,"status"=>"ACTIVE"])->with('translations')->first();
        
        if (!$page)
        	return response(['message'=>'page not found'], 404);

        return response([
            'page'=>Helper::page($page),
            'contents'=>$this->getContent($id),
        ],200);
    }
    public function getContent($id):array
    {
        $pageContent = [];
        $contents = Page::find($id)->getPageContents()->with('translations')->orderBy('id','ASC')->get();
        foreach ($contents as $k => $content) {
            $pageContent[] = [
                'files'=>$this->getFiles($content->image),
                'ar'=>[
                    'title'=>$content->title,
                    'content'=>$content->content,

                ],
                'en'=>Helper::toTranslation($content->translations)
            ];
        }
        return  $pageContent;

    }

    protected function getFiles($files):array
    {
        if (! json_decode($files)) 
            return [Voyager::image($files)];

        $urls = [];
        foreach (json_decode($files) as $file) {
            array_push($urls, Voyager::image($file));
        }
        return $urls;
    }
}
