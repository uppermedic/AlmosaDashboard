<?php
/**
 * created by aziz(aziz.adel.fci@gmail.com)
 **/
namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Models\Doctor;
use App\Models\Page;
use TCG\Voyager\Facades\Voyager;


class DoctorController extends Controller
{
    public function show()
    {
        $page = Page::where('id','=',9)->firstOrFail();
        return response([
            'page' => Helper::page($page),
            'doctors'=>$this->getDoctors()
        ]);
    }

    protected function getDoctors():array
    {
$data = [];
        $doctors = Doctor::with('translations')->paginate(8);
        $data['current_page'] = $doctors->currentPage();
        $data['next_page_url'] = $doctors->nextPageUrl();
        $data['prev_page_url'] = $doctors->previousPageUrl();
        $data['total'] = $doctors->total();
        $data['last_page'] = $doctors->lastPage();
        $data['data'] = [];
        foreach ($doctors->items() as $doctor) {
            array_push($data['data'],[
                'image' => Voyager::image($doctor->image),
                'id'=>$doctor->id,
                'ar' => [
                    'name' => $doctor->name,
                    'slug'=>$doctor->slug,
                    'title' => $doctor->title,
                    'qualifications' => $doctor->qualifications,
                    'current_positions'=>$doctor->current_positions,
                ],
                'en'=>Helper::toTranslation($doctor->translations),

            ]);
        }
        return $data;
    }

    public function filter(Request $request)
    {
        $section_id = (int)$request->post('section_id');

        $heads = Section::find($section_id)->doctors;
        $heads = $heads->load('translations');
        $heads = [
            'image' => Voyager::image($heads->image),
            'id'=>$heads->id,
            'ar' => [
                'name' => $heads->name,
                'slug'=>$heads->slug,
                'title' => $heads->title,
                'qualifications' => $heads->qualifications,
                'current_positions'=>$heads->current_positions,
            ],
            'en'=>Helper::toTranslation($heads->translations),

        ];

        $doctors = Doctor::whereSection_id($section_id)->with('section','translations')->paginate(2);

        $doctors_data['current_page'] = $doctors->currentPage();
        $doctors_data['next_page_url'] = $doctors->nextPageUrl();
        $doctors_data['prev_page_url'] = $doctors->previousPageUrl();
        $doctors_data['total'] = $doctors->total();
        $doctors_data['last_page'] = $doctors->lastPage();
        $doctors_data['data'] = [];
        foreach ($doctors->items() as $doctor) {
            array_push($doctors_data['data'],[
                'image' => Voyager::image($doctor->image),
                'id'=>$doctor->id,
                'ar' => [
                    'name' => $doctor->name,
                    'slug'=>$doctor->slug,
                    'title' => $doctor->title,
                    'qualifications' => $doctor->qualifications,
                    'current_positions'=>$doctor->current_positions,
                ],
                'en'=>Helper::toTranslation($doctor->translations),

            ]);
        }
        return response(['SectionHead'=>$heads,'doctors'=>$doctors_data],200);
    }
}
