<?php
/**
 * created by aziz(aziz.adel.fci@gmail.com)
 **/
namespace App\Http\Controllers\Api;
use App\Http\Controllers\Controller;
use Illuminate\Http\Request;

use App\Models\Page;
use App\Models\PageItem;
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
        $contents = Page::find($id)->getPageContents()->with('translations')->orderBy('order','ASC')->get();
        foreach ($contents as $k => $content) {
            $pageContent[] = [
                'order'=>$content->order,
                'files'=>$this->getFiles($content->image),
                'name'=>$content->name,
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
            $data = $this->responsePageItem($pageItem);
            // if ($pageItem->section_id) {
            /*$pageItem->section_id ?
                $pageItemResponse[ $pageItem->section_id ][] = [
                    'section' => [
                        'ar' => ['title_ar' => optional($pageItem->section)->title],
                        'en' => Helper::toTranslation(optional($pageItem->section)->translations),
                        'page_item' => $data
                    ]
                ]:*/
                $pageItemResponse[] = $data;
            // }
        }
        return  $pageItemResponse;
    }

    public function showPageItem(PageItem $pageItem):array
    {
        return $this->responsePageItem($pageItem);
    }

    public function responsePageItem($pageItem):array
    {
        $data = [
            'id'=>$pageItem->id,
            'url'=>$pageItem->url,
            'color'=>$pageItem->color,
            'image'=>$this->getFiles($pageItem->image),
            'ar'=>[
                'slug'=>$pageItem->slug,
                'canonical_link'=>$pageItem->canonical_link,
                'meta_title'=>$pageItem->meta_title,
                'meta_description'=>$pageItem->meta_description,
                'name'=>$pageItem->name,
                'title'=>$pageItem->title,
                'content'=>$pageItem->content,
            ],
            'en'=>Helper::toTranslation($pageItem->translations)
        ];

        if ($pageItem->section_id) 
            $data ['section'] = [
                    'id' => $pageItem->section_id,
                    'ar' => ['title' => optional($pageItem->section)->title],
                    'en' => Helper::toTranslation(optional($pageItem->section)->translations),
                ];
        return $data;
    }

    protected function getFiles($files):array
    {
        $urls = [];

        if ( is_string($files) ){
            $files = json_decode($files) ?? [$files];

            foreach ($files as $file) {
                array_push($urls, Voyager::image($file));
            }
        } 

        return $urls;
    }

    public function storePageItem (Request $req)
    {
        foreach($req->all() as $request) {
            $request = new Request($request);
            $pageItem = PageItem::create($request->except(['image', 'en', 'page_content_ids']));
            $pageItem->pageContents()->sync($request->page_content_ids);
            if ($request->en && !empty($request->en)) {
                $translation['table_name'] = 'page_items';
                $translation['locale'] = 'en';
                $translation['foreign_key'] = $pageItem->id;
                foreach($request->en as $key => $value)
                {
                    $translation['column_name'] = $key;
                    $translation['value'] = $value;
                    \DB::table('translations')->insert($translation);
                }
            }
            foreach($request->image as $basename => $image)
                \Storage::put('public/page-items/'.$basename, file_get_contents($image));

            $pageItem->update(['image'=>'page-items/'.$basename]);
        }

        return response([
            'Message'=>'Successfully Done',
        ],200);
    }
}
