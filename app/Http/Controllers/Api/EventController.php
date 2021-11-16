<?php
/**
 * created by aziz(aziz.adel.fci@gmail.com)
 **/
namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Jobs\EventRegisteredJob;
use App\Mail\EventRegistered;
use App\Models\Event;
use App\Models\EventAttendance;
use App\Models\EventCategory;
use App\Models\Page;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\App;

use Illuminate\Support\Facades\Mail;
use Illuminate\Support\Facades\Validator;
use TCG\Voyager\Facades\Voyager;


class EventController extends Controller
{
    private $page;

    public function __construct()
    {
        $this->page = Page::where(['id' => 6, 'status' => 'ACTIVE'])->with('translations')->first();
        $this->page = Helper::page($this->page);
    }

    public function show()
    {
        $data['page'] =  $this->page;
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

	$type = htmlspecialchars(strtoupper($type)) ;
        $year = htmlspecialchars(request()->get('year'));
        $category =(int) htmlspecialchars(request()->get('category'));
        $status = htmlspecialchars(strtoupper(request()->get('status')));

	$query = new Event();

        if($year){

           $query =  $query->where('start_date', 'LIKE', "%{$year}%");
        }
        if($category) {
            $query = $query->where('event_category_id','=', $category);

        }
        if($status) {
            $query =  $query->where('status','LIKE', $status);
        }

        $events = $query->where('type','LIKE',$type)->with('translations')->paginate(10);
	/*
	 $query = Event::where('type',$type);

        if(isset($year)) $query->where('start_date','LIKE',"%{$year}%");
        if(isset($category)) $query->where('event_category_id',$category);
        if(isset($status)) $query->where('status',$status);
	$events = $query->with('translations')->paginate(10);*/
	/*
	 $events = Event::where(function ($query)use($category,$type){
            if ($category !=''&& !is_null($category))$query->where('type',$type)->where('event_category_id',$category);
        })->orWhere(function ($query)use ($status,$type){
            if ($status !=''&& !is_null($status))$query->where('type',$type)->where('status',$status);
        })->orWhere(function ($query) use($year,$type){
            if ($year !=''&& !is_null($year))$query->where('type',$type)->where('start_date','LIKE',"%{$year}%");
        })->with('translations')->paginate(10);
	*/


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
        $data['page'] =  $this->page;
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

    public function registerToEvent(Request $request)
    {
        /*$this->validatorData(request()->all());*/
        $validate = Validator::make($request->all(),[
            'event_id' =>'required|integer',
            'firstName'=>'required|string|max:200',
            'lastName'=>'required|string|max:200',
            'email'=>'required|email|string|max:200',
            'phone'=>'required|string|max:200',
            'speciality'=>'required|string|max:200',
            'city'=>'required|string|max:200',
            'scfhs_no'=>'required|string|max:200',
            'position'=>'required|string|max:200',
            'hospital'=>'required|string|max:200',
        ]);
        if ($validate->fails()) {
            return response(['message'=>'Oops,some data missing!','errors'=>$validate->errors(),'success'=>false],201);
        }
        $data = $this->create($request->all());
        return response(['message'=>$data,'errors'=>$validate->errors(),'success'=>true],200);
    }

    protected function create(array $data)
    {
        $user = EventAttendance::firstOrCreate([
                'firstName'=>$data['firstName'],
                'lastName'=>$data['lastName'],
                'email'=>$data['email'],
                'city'=>$data['city'],
                'phone'=>$data['phone'],
                'speciality'=>$data['speciality'],
                'scfhs_no'=>$data['scfhs_no'],
                'position'=>$data['position'],
                'hospital'=>$data['hospital'],
        ]);
	 $eventExist = $user->event->find($data['event_id']);
        $getEvent = Event::find($data['event_id']);
        if ($eventExist) {
            return 'you are already registered to this '.strtolower($getEvent->type);
        }
        $user->event()->attach($data['event_id']);
	EventRegisteredJob::dispatch($user);
        return 'Thanks!.You are register successfully to the '.strtolower($getEvent->type).'.Please check your mail';
    }
}

