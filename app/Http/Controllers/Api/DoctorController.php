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
        $doctors = Doctor::with('translations')->get();
        foreach ($doctors as $doctor) {
            array_push($data,[
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
}
