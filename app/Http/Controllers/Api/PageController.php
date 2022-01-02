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
        $contents = Page::find($id)->getPageContents()->with('translations')->orderBy('id','DESC')->get();
        foreach ($contents as $k => $content) {
            $pageContent[] = [
                'files'=>$this->getFiles($content->image),
                'ar'=>[
                    'title'=>$content->title,
                    'content'=>$content->content,
                ],
                'en'=>Helper::toTranslation($content->translations),
                'page_items'=>$this->getPageItem($content)
            ];
        }
        return  $pageContent;
    }

    public function getPageItem($pageContent):array
    {
    	$pageItemResponse = [];
        $pageItems = $pageContent->pageItems()->with('translations')->get();
        foreach ($pageItems as $k => $pageItem) {
            $data = [
                'section'=>$pageItem->section,
                'url'=>$pageItem->url,
                'color'=>$pageItem->color,
                'image'=>$this->getFiles($pageItem->image),
                'ar'=>[
                    'slug'=>$pageItem->slug,
                    'name'=>$pageItem->name,
                    'title'=>$pageItem->title,
                    'content'=>$pageItem->content,
                ],
                'en'=>Helper::toTranslation($pageItem->translations),
            ];
            $pageItem->group ?
                $pageItemResponse[$pageItem->section][ $pageItem->group ][] = $data :
                $pageItemResponse[$pageItem->section][] = $data;
        }
        return  $pageItemResponse;
    }

    protected function getFiles($files):array
    {
        $files = json_decode($files) ?? $files;

        if ( is_string($files) ) 
            return [Voyager::image($files)];

        $urls = [];
        foreach ($files as $file) {
            array_push($urls, Voyager::image($file));
        }
        return $urls;
    }
}
