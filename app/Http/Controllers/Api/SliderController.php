<?php


namespace App\Http\Controllers\Api;


use App\Http\Controllers\Controller;
use App\Models\Slider;
use TCG\Voyager\Facades\Voyager;

class SliderController extends Controller
{
    public static function HomeSlider()
    {
        $sliders = Slider::with('translations')->orderBy('order')->get();

        $data = [];
        foreach ($sliders as $slider) {
            array_push($data,
                [
                    'image' => Voyager::image($slider->image),
                    'btn_link'=>$slider->btn_link,
                    'ar' => [
                        'title' => $slider->title,
                        'content' => $slider->content,
                        'btn_text'=>$slider->btn_text,
                    ],
                    'en'=>Helper::toTranslation($slider->translations)
                ]);
        }
        return $data;
    }

}
