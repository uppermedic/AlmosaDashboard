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
            'id' => $this->id,
            'type' => 'doctor',
            'image' => Voyager::image($this->image),
            'ar' => [
                'title' => $this->name,
                'content' => $this->title,
                /*'qualifications' => $this->qualifications,
                'specialization' => $this->specialization,
                'degree' => $this->degree,
                'areas_of_expertise' => $this->areas_of_expertise,*/
            ],
            'en' => [
                'title' => Helper::toTranslation($this->translations, ['name'])['name'],
                'content' => Helper::toTranslation($this->translations, ['title'])['title']
            ]
        ];
    }
}
