<?php

namespace App\Http\Resources;

use Illuminate\Http\Resources\Json\JsonResource;

use TCG\Voyager\Facades\Voyager;
use App\Http\Controllers\Api\Helper;

class ServiceResource extends JsonResource
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
            'type' => Helper::toTranslation(optional($this->serviceCategory)->translations, ['slug'])['slug'],
            'image' => Voyager::image($this->image),
            'ar' => [
                'title' => $this->title,
                'content' => $this->content,
            ],
            'en' => Helper::toTranslation($this->translations, ['title', 'content'])
        ];
    }
}
