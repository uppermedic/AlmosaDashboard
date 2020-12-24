<?php
/**
 * created by aziz(aziz.adel.fci@gmail.com)
 **/
namespace App\Http\Controllers\Api;
use App\Http\Controllers\Controller;
use App\Models\Community;
use App\Models\Page;
use TCG\Voyager\Facades\Voyager;

class CommunityController extends Controller
{
    public function show()
    {
        $page = Page::where('id', '=', 10)->with('translations')->firstOrFail();
        return response([
            'page' => Helper::page($page),
            'communities'=>$this->getCommunities()
            ], 200);
    }

    public function getCommunities():array
    {
        $data = [];
        $communities = Community::with('translations')->get();
        foreach ($communities as $community) {
            array_push($data, [
                'thumbnail' => Voyager::image($community->thumbnail),
                'color'=>$community->color,
                'id'=>$community->id,
                'ar'=>[
                    'slug'=>$community->slug,
                    'title'=>$community->title
                ],
                'en'=>Helper::toTranslation($community->translations,['title','slug']),
            ]);
        }
        return $data;
    }

    public function getCommunity(int $id)
    {
        $data = [];
        $community = Community::where('id', '=', $id)->with('translations')->first();
        $data['cover_image'] = Voyager::image($community->image);
        $data['ar'] = [
            'title'=>$community->title,
            'slug'=>$community->slug0
        ];
        $data['en']= Helper::toTranslation($community->translations);
        $data['contents'] = $this->getContent($community);
        $data['objectives']=$this->getObjectives($community);
        $data['participating'] = $this->getParticipating($community);
        return $data;
    }

    protected function getContent($community)
    {
        $contents = $community->contents;

        $data = [];
        foreach ($contents as $content) {

            array_push($data, [
                'images'=>$this->getContentImages($content['photos']),
                'video'=>$content->video,
                'ar'=>[
                    'title' => $content->title,
                    'content'=>$content->content,
                ],
                'en' => Helper::toTranslation($content->translations),

            ]);
        }
        return $data;
    }

    protected function getContentImages($contentImages):array
    {

        $images = [];
        foreach (json_decode($contentImages) as $image) {
            array_push($images,Voyager::image($image));
        }
        return $images;
    }

    protected function getObjectives($community)
    {
        $data = [];
        $objectives =  $community->objectives;
        $objectives->load('translations');
        foreach ($objectives as $objective) {
            array_push($data, [
                'icon' => Voyager::image($objective->icon),
                'ar' => [
                    'title'=>$objective->title,
                ],
                'en'=>Helper::toTranslation($objective->translations)
            ]);
        }
        return $data;
    }

    protected function getParticipating($community)
    {
        $data = [];
        $parts = $community->participation;
        $parts->load('translations');
        foreach ($parts as $part) {
            array_push($data, [
                'image' => Voyager::image($part->image),
                'ar' => [
                    'title' => $part->title,

                ],
                'en'=>Helper::toTranslation($part->translations)
            ]);
        }
        return $data;
    }
}
