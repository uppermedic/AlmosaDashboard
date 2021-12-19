<?php
/**
 * created by aziz(aziz.adel.fci@gmail.com)
 **/
namespace App\Http\Controllers\Api;
use App\Http\Controllers\Controller;
use Illuminate\Http\Request;

use App\Models\Blog;
use App\Models\Doctor;
use App\Models\Service;
use App\Models\Event;

use App\Http\Resources\BlogResource;
use App\Http\Resources\DoctorResource;
use App\Http\Resources\ServiceResource;
use App\Http\Resources\EventResource;

use Illuminate\Pagination\Paginator;
use Illuminate\Pagination\LengthAwarePaginator;
use Illuminate\Support\Collection;

class SearchController extends Controller{

    /**
     * @param string $q
     * @return array
     */
    public function show(string $q): array
    {
//	 return BlogController::search($q);
     return BlogController::advancedSearch($q);
    }

    public function all(Request $request)
    {
        $request->validate([
            'search_query' => 'required|string|min:3',
        ]);
        $blogs = Blog::select('id','title','content','type','image')
                        ->where('status','PUBLISHED')
                        ->where(function($query){
                            return $query->where('title','LIKE','%'.request()->search_query.'%')
                                        ->orWhere('content','LIKE','%'.request()->search_query.'%')
                                        ->orWhereHas('translations', function($query){
                                            return $query->where('translations.value', 'LIKE', '%' . request()->search_query . '%');
                                        });
                        })->with('translations')->get();

        $doctors = Doctor::select('id','name','title','qualifications','specialization','degree','areas_of_expertise','image')
                        ->where(function($query){
                            return $query->where('title','LIKE','%'.request()->search_query.'%')
                                        ->orWhere('name','LIKE','%'.request()->search_query.'%')
                                        ->orWhere('qualifications','LIKE','%'.request()->search_query.'%')
                                        ->orWhere('specialization','LIKE','%'.request()->search_query.'%')
                                        ->orWhere('degree','LIKE','%'.request()->search_query.'%')
                                        ->orWhere('areas_of_expertise','LIKE','%'.request()->search_query.'%')
                                        ->orWhereHas('translations', function($query){
                                            return $query->where('translations.value', 'LIKE', '%' . request()->search_query . '%');
                                        });
                        })->with('translations')->get();

        $services = Service::select('id','title','content','image','service_category_id')
                        ->where(function($query){
                            return $query->where('title','LIKE','%'.request()->search_query.'%')
                                        ->orWhere('content','LIKE','%'.request()->search_query.'%')
                                        ->orWhereHas('translations', function($query){
                                            return $query->where('translations.value', 'LIKE', '%' . request()->search_query . '%');
                                        });
                        })->with('translations')->get();

        $events = Event::select('id','title','content','type','image')
                        ->where(function($query){
                            return $query->where('title','LIKE','%'.request()->search_query.'%')
                                        ->orWhere('content','LIKE','%'.request()->search_query.'%')
                                        ->orWhereHas('translations', function($query){
                                            return $query->where('translations.value', 'LIKE', '%' . request()->search_query . '%');
                                        });
                        })->with('translations')
                        ->get();
        $items = BlogResource::collection($blogs)
                    ->merge(DoctorResource::collection($doctors))
                    ->merge(ServiceResource::collection($services))
                    ->merge(EventResource::collection($events));
        return $this->paginate($items);
        return [
            'blogs' => BlogResource::collection($blogs),
            'doctors' => DoctorResource::collection($doctors),
            'services' => ServiceResource::collection($services),
            'events' => EventResource::collection($events),
        ];
    }

    public function paginate($items, $perPage = 15, $page = null, $options = [])
    {
        $page = $page ?: (Paginator::resolveCurrentPage() ?: 1);
        $items = $items instanceof Collection ? $items : Collection::make($items);
        return new LengthAwarePaginator($items->forPage($page, $perPage), $items->count(), $perPage, $page, $options);
    }

}
