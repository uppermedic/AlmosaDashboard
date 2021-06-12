<?php


namespace App\Http\Controllers\Api;


use App\Http\Controllers\Controller;
use App\Models\AcademicTeam;
use TCG\Voyager\Facades\Voyager;

class AcademicTeamController extends Controller
{
    public function getTeam()
    {
        $teams = AcademicTeam::with('translations')->get();
        $data = [];

        foreach ($teams as $team) {
            array_push($data,[
                'id'=>$team->id,
                'image' => Voyager::image($team->image),
                'ar'=>[
                    'name' => $team->name,
                    'title' => $team->title,

                ],
                'en'=>Helper::toTranslation($team->translations)
            ]);
        }
        return response($data,200);
    }
}
