<?php
/**
 * created by aziz(aziz.adel.fci@gmail.com)
 **/
namespace App\Http\Controllers\Api;
use App\Http\Controllers\Controller;
use App\Models\Doctor;
use App\Models\Page;
use App\Models\Section;
use Illuminate\Contracts\Foundation\Application;
use Illuminate\Contracts\Routing\ResponseFactory;
use Illuminate\Http\Request;
use Illuminate\Http\Response;
use TCG\Voyager\Facades\Voyager;

class DoctorController extends Controller
{
    public function show()
    {
        $page = Page::where('id','=',9)->firstOrFail();
        return response([
            'page' => Helper::page($page),
            'doctors'=>$this->getDoctors(),
            'our_doctors' => $this->getOurDoctors()
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
                'section_id'=>$doctor->section_id,
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

    /**
     * @param object|null $doctors
     * @param false $noResults
     * @return array|string
     */
    private function getOurDoctors(object $doctors = null, bool $noResults = false)
    {
        if($noResults) {
            return 'no doctors found in this section';
        }
        if (!$doctors) {
            $doctors = Doctor::with('translations')->paginate(8);
        }

        $data = [];
        $data['current_page'] = $doctors->currentPage();
        $data['next_page_url'] = $doctors->nextPageUrl();
        $data['prev_page_url'] = $doctors->previousPageUrl();
        $data['total'] = $doctors->total();
        $data['last_page'] = $doctors->lastPage();
        $data['data'] = [];
        foreach ($doctors->items() as $doctor) {
            $data['data'][] = [
                'image' => Voyager::image($doctor->image),
                'id' => $doctor->id,
                'section_id' => $doctor->section_id,
                'slug' => $doctor->slug,
                'ar' => $this->getQualifications($doctor, 'ar'),
                'en' => $this->getQualifications($doctor, 'en'),

            ];
        }
        return $data;
    }

    /**
     * @param $doctor
     * @param string $lang
     * @return array
     */
    private function getQualifications($doctor, string $lang = 'ar'): array
    {
        if ($lang === 'en') {
            return [
                'name' => Helper::getColumnTranslation($doctor->translations, 'name') ?? $doctor->name,
                'title' => Helper::getColumnTranslation($doctor->translations, 'title') ?? $doctor->title,
                'qualifications' => [
                    'Specialization' => Helper::getColumnTranslation($doctor->translations, 'specialization') ?? $doctor->specialization,
                    'Degree' => Helper::getColumnTranslation($doctor->translations, 'degree') ?? $doctor->degree,
                    'Areas of Expertise' => Helper::getColumnTranslation($doctor->translations, 'areas_of_expertise') ?? $doctor->areas_of_expertise,
                    'Nationality' => Helper::getColumnTranslation($doctor->translations, 'nationality') ?? $doctor->nationality,
                    'Languages' => Helper::getColumnTranslation($doctor->translations, 'languages') ?? $doctor->languages,
                    'The Age Group of Patients' => Helper::getColumnTranslation($doctor->translations, 'age_group') ?? $doctor->age_group,
                ],
                'current_positions' => $doctor->current_positions,
            ];
        }

        return [
            'name' => $doctor->name,
            'title' => $doctor->title,
            'qualifications' => [
                'التخصص' => $doctor->specialization,
                'الدرجة' => $doctor->degree,
                'مجالات الخبرة' => $doctor->areas_of_expertise,
                'الجنسية' => $doctor->nationality,
                'اللغات' => $doctor->languages,
                'الفئة العمرية للمرضى' => $doctor->age_group,
            ],
            'current_positions' => $doctor->current_positions,
        ];
    }

    /**
     * @param $doctor
     * @return array
     */
    private function getSocialInfo($doctor): array
    {
        return [
            'facebook' => $doctor->facebook,
            'twitter' => $doctor->twitter,
            'linkedin' => $doctor->linkedin,
            'website_url' => $doctor->website_url,
            'whatsapp_number' => $doctor->whatsapp_number,
        ];
    }

    /**
     * @param $slug
     * @return Application|ResponseFactory|Response
     */
    public function getDoctor($slug)
    {
        $page = Page::where('id','=',9)->firstOrFail();
        $doctor = Doctor::where('slug', $slug)->with('translations')->firstOrFail();
        $data = [];
        $data['page'] = Helper::page($page);
        $data['data']['slug'] = $doctor->slug;
        $data['data']['image'] = Voyager::image($doctor->image);
        $data['data']['id'] = $doctor->id;
        $data['data']['section_id'] = $doctor->section_id;
        $data['data']['ar'] = $this->getQualifications($doctor, 'ar');
        $data['data']['en'] = $this->getQualifications($doctor, 'en');
        $data['social'] = $this->getSocialInfo($doctor);

        return response($data);
    }

    public function filter(Request $request)
    {
        $section_id = (int)$request->section_id;

        $heads = Section::find($section_id);
        if($heads) {
            $noResults = false;
            $heads = $heads->doctors;
            $heads = $heads->load('translations');
            $heads = [
                'image' => Voyager::image($heads->image),
                'id' => $heads->id,
                'ar' => [
                    'name' => $heads->name,
                    'slug' => $heads->slug,
                    'title' => $heads->title,
                    'qualifications' => $heads->qualifications,
                    'current_positions' => $heads->current_positions,
                ],
                'en' => Helper::toTranslation($heads->translations),

            ];
//        $doctors = Doctor::whereSection_id($section_id)->with('section','translations')->paginate(12);
            $doctors = Doctor::whereSection_id($section_id)->with('translations')->paginate(12);

            $doctors_data['current_page'] = $doctors->currentPage();
            $doctors_data['next_page_url'] = $doctors->nextPageUrl();
            $doctors_data['prev_page_url'] = $doctors->previousPageUrl();
            $doctors_data['total'] = $doctors->total();
            $doctors_data['last_page'] = $doctors->lastPage();
            $doctors_data['data'] = [];
            foreach ($doctors->items() as $doctor) {
                $doctors_data['data'][] = [
                    'image' => Voyager::image($doctor->image),
                    'id' => $doctor->id,
                    'ar' => [
                        'name' => $doctor->name,
                        'slug' => $doctor->slug,
                        'title' => $doctor->title,
                        'qualifications' => $doctor->qualifications,
                        'current_positions' => $doctor->current_positions,
                    ],
                    'en' => Helper::toTranslation($doctor->translations),

                ];
            }
        } else {
            $noResults = true;
            $doctors_data = 'no doctors found in this section';
        }
	$page = Page::where('id','=',9)->firstOrFail();

        return response(['page' => Helper::page($page),'SectionHead'=>$heads,'doctors'=>$doctors_data, 'our_doctors' => $this->getOurDoctors($doctors ?? null, $noResults)],200);
    }
}
