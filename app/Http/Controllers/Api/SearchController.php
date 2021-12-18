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

    public function all(Request $request): array
    {
        $request->validate([
            'search_query' => 'required|string|min:50',
        ]);
        $blogs = Blog::select('id','title','content','type', 'status','image')
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

        $services = Service::select('id','title','content','color','thumbnail','icon','image')
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

        return [
            'blogs' => BlogResource::collection($blogs),
            'doctors' => DoctorResource::collection($doctors),
            'services' => ServiceResource::collection($services),
            'events' => EventResource::collection($events),
        ];
    }

}
