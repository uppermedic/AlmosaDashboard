<?php
/**
 * created by aziz(aziz.adel.fci@gmail.com)
 **/
namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Models\History;
use App\Models\Page;

class HistoryController extends Controller
{
    public function show()
    {
        $page = Page::where(['id'=>11,"status"=>"ACTIVE"])->with('translations')->first();
if (is_null($page) ) return response(['status'=>'ERROR','message'=>'page not found'],404);
        return response([
            'page'=>Helper::page($page),
            'histories'=>$this->getHistory(),
        ],200);
    }


    public function getHistory(): array
    {
        $histories = History::with('translations')->orderBy('year','ASC')->get();
        $data = [];
        foreach ($histories as $history) {
            array_push($data,[
                'year'=>$history->year,
                'ar'=>['content'=>$history->content],
                'en'=>Helper::toTranslation($history->translations)
            ]);
        }
        return $data;
    }
}
