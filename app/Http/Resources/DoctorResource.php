<?php

namespace App\Http\Resources;

use Illuminate\Http\Resources\Json\JsonResource;

use TCG\Voyager\Facades\Voyager;
use App\Http\Controllers\Api\Helper;

class DoctorResource extends JsonResource
{
    /**
     * Transform the resource into an array.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return array
     */
    public function toArray($request)
    {
        // return parent::toArray($request);
        return [
            'image' => Voyager::image($this->image),
            'ar' => [
                'name' => $this->name,
                'title' => $this->title,
                'qualifications' => $this->qualifications,
                'specialization' => $this->specialization,
                'degree' => $this->degree,
                'areas_of_expertise' => $this->areas_of_expertise,
            ],
            'en' => Helper::toTranslation($this->translations, 
                                            [
                                                'name' ,
                                                'title' ,
                                                'qualifications' ,
                                                'specialization' ,
                                                'degree' ,
                                                'areas_of_expertise' ,
                                            ])
        ];
    }
}
