<?php
/**
 * created by aziz(aziz.adel.fci@gmail.com)
 **/
namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Models\Event;
use App\Models\EventCategory;
use App\Models\Page;
use Illuminate\Support\Facades\App;
use Illuminate\Support\Facades\Request;
use TCG\Voyager\Facades\Voyager;

class EventController extends Controller
{
    public function show()
    {
        $page = Page::where(['id' => 6, 'status' => 'ACTIVE'])->with('translations')->first();
        $data['page'] =  Helper::page($page);
        return response($data,200);

    }

    /**
     * @param $type
     * @return \Illuminate\Contracts\Foundation\Application|\Illuminate\Contracts\Routing\ResponseFactory|\Illuminate\Http\Response
     */
    public function getEventsOrCourses($type)
    {
        $type = strtoupper($type);

        $events = Event::where('type', $type)->with('translations')->paginate(10);

        return response($this->pagination($events),200);

    }

    /**
     * @return \Illuminate\Contracts\Foundation\Application|\Illuminate\Contracts\Routing\ResponseFactory|\Illuminate\Http\Response
     */
    public function getEventCategories()
    {
        $data = [];
        $categories = EventCategory::with('translations')->get();
        foreach ($categories as $category) {
            array_push($data, [
                'id'=>$category->id,
                'ar'=>[
                    'name'=>$category->name,
                ],
                'en'=>Helper::toTranslation($category->translations,['name']),

            ]);
        }
        return response($data, 200);
    }

    /**
     * @param $type
     * @return \Illuminate\Contracts\Foundation\Application|\Illuminate\Contracts\Routing\ResponseFactory|\Illuminate\Http\Response
     */
    public function filtration($type)
    {

        $type = strtoupper($type);
        $year = request()->get('year');
        $category =(int) request()->get('category');
        $status = strtoupper(request()->get('status'));
        $events = Event::where('type',$type)->where('event_category_id',$category)
            ->where('status',$status)->where('created_at','LIKE',"%{$year}%")->with('translations')->paginate(10);



        return response($this->pagination($events),200);/*request()->get('type');*/
    }

    /**
     * @param $events
     * @return array
     */
    protected function pagination($events): array
    {
        $data = [];
        $data['current_page']= $events->currentPage();
        $data['previous_page_url'] = $events->previousPageUrl();
        $data['next_page_url'] = $events->nextPageUrl();
        $data['last_page'] = $events->lastPage();
        $data['base_path']= $events->getOptions()['path'];
        $data['data']=[];
        foreach ($events->items() as $event) {
            array_push($data['data'],[
                'id'=>$event->id,
                'image'=>Voyager::image($event->image),
                'start_date'=>$event->start_date,
                'end_date'=>$event->end_date,
                'cost'=>(!empty($event->cost))?$event->cost:"free",
                'ar' => [
                    'title'=>$event->title,
                    'speaker_name'=>$event->speaker_name,
                ],
                'en'=>Helper::toTranslation($event->translations,['title','speaker_name'])
            ]);
        }
        return $data;
    }


    public function getSingleEvent($event_id)
    {
        $data = [];
        $event = Event::where('id', $event_id)->with('translations')->first();
        $data['id']= $event->id;
        $data['start_date']= $event->start_date;
        $data['end_date']= $event->end_date;
        $data['cost']= (!empty($event->cost))?$event->cost:'free';
        $data['image']= Voyager::image($event->image);
        $data['phone']= $event->phone;
        $data['email']= $event->email;
        $data['type'] = strtolower($event->type);
        $data['status'] = strtolower($event->status);
        $data['ar'] = [
            'title' => $event->title,
            'content' => $event->content,
            'speaker_name' => $event->speaker_name,
            'location' => $event->location,

        ];
        $data['en']=Helper::toTranslation($event->translations);
        /* get event categories with translations */
        $event_category = $event->categories->load('translations');

        $data['categories'] = $this->getSingleEventCategories($event_category);

        /* get event timeLines with translations */
        $event_timelines = $event->timelines->load('translations');

        $data['timelines'] = $this->getSingleEventTimeLines($event_timelines);
        return response($data,200);
    }

    /**
     * @param $event_categories
     * @return array
     */
    protected function getSingleEventCategories($event_categories): array
    {
        $data['ar'] = [
            'name'=>$event_categories->name
        ];
        $data['en'] = Helper::toTranslation($event_categories->translations);

        return $data;

    }

    /**
     * @param $timelines
     * @return array
     */
    protected function getSingleEventTimeLines($timelines):array
    {
        $data = [];
        foreach ($timelines as $timeline) {
            array_push($data, [
                'start'=>$timeline->start,
                'end'=>$timeline->end,
                'ar'=>[
                    'title' => $timeline->title,
                    'lecture_title'=>$timeline->lecture_title,
                ],
                'en'=>Helper::toTranslation($timeline->translations),
            ]);
        }
        return $data;
    }

    public function registerToEvent()
    {
        return \request()->get('name');
    }
}

