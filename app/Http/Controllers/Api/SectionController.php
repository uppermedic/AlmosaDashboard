<?php


namespace App\Http\Controllers\Api;


use App\Models\Section;

class SectionController
{
    public function show()
    {
        $sections = Section::with('translations')->get();
        $data = [];

        foreach ($sections as $section) {
            array_push($data, [
                'section_id'=>$section->id,
                'ar'=>[
                    'title'=>$section->title,
                ],
                'en'=>Helper::toTranslation($section->translations,['title']),
            ]);
        }
        return response( $data,200);
    }
}
