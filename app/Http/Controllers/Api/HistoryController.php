<?php
/**
 * created by aziz(aziz.adel.fci@gmail.com)
 **/
namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Models\History;
use App\Models\HistoryHead;
use App\Models\Page;
use TCG\Voyager\Facades\Voyager;

class HistoryController extends Controller
{
    public function show()
    {
        $page = Page::where(['id'=>11,"status"=>"ACTIVE"])->with('translations')->first();
if (is_null($page) ) return response(['status'=>'ERROR','message'=>'page not found'],404);
        return response([
            'page'=>Helper::page($page),
            'data'=>$this->getHistory(),
        ],200);
    }


    public function getHistory()
    {
        $histories = HistoryHead::with('histories','translations')->get();
        $data = [];
        //dd($histories);
        foreach ($histories as $history) {
            array_push($data,[
                'head'=>$history->from_to,
                'ar'=>[
                    'title'=>$history->title,
                    'description'=>$history->description,
                ],
                'en'=>Helper::toTranslation($history->translations),
                'histories'=>$this->histories($history->histories),
            ]);
        }
        return $data;
    }

    public function histories($histories)
    {
        $data = [];
        foreach($histories as $history){
            array_push($data,[
                'year'=>$history->year,
                'image'=>Voyager::image($history->image),
                'ar'=>['content'=>$history->content],
                'en'=>Helper::toTranslation($history->translations)
            ]);

        }
        return $data;
    }
}
