<?php
/**
 * Email: aziz.adel.fci@gmail.com
 * User: aziz
 * Date: 12/13/20
 * Time: 11:31 AM
 */

namespace App\Http\Controllers\Api;

use App\Models\Page;
use TCG\Voyager\Facades\Voyager;

class Helper{
    /**
     * get header data
     * @return array
     */
    public static function header():array
    {
        return [
            'logo'=>Voyager::image(setting('site.logo')),
            'second_logo'=>Voyager::image(setting('site.second_logo')),
            'third_logo'=>Voyager::image(setting('site.third_logo')),
            'site_title'=>['ar'=>setting('site.title'),'en'=>setting('site.site_title_en')],
            'site_description'=>['ar'=>setting('site.description'),'en'=>setting('site.description_en')],
        ];
    }

    /**
     * get footer data
     * @return array
     */
    public static function footer():array
    {
        return [
            'welcome_title'=>['ar'=>setting('footer.wellcome_title'),'en'=>setting('footer.welcome_title_en')],
            'welcome_msg'=>['ar'=>setting('footer.wellcome_content'),'en'=>setting('footer.welcome_content_en')],
            'facebook_url'=>setting('footer.facebook'),
            'instagram_url'=>setting('footer.instagram_url'),
            'twitter_url'=>setting('footer.twitter_url'),
            'linkedin_url'=>setting('footer.linkedin_url'),
            'youtube_url'=>setting('footer.youtube_url'),
            'contact_us'=>[
                'location'=>['ar'=>setting('contact-us.addess'),'en'=>setting('contact-us.addess_en')],
                'location_url'=>setting('contact-us.location_url'),
                'contact_phone'=>setting('contact-us.contact_phone'),
                'contact_email'=>setting('contact-us.conact_email')
            ],

        ];
    }

    /**
     * handle the translations
     * get specified columns
     * @param $translations
     * @param null $columns
     * @return array
     */
    public static function toTranslation($translations,$columns=[]):array
    {
        $getTranslatedItems = [];
        if( !empty($columns)){
            foreach ($translations as $translation) {
                if(in_array($translation['column_name'],$columns)){
                    $getTranslatedItems[$translation['column_name']] = $translation['value'];
                }

            }
        }else{
            foreach ($translations as $translation) {
                $getTranslatedItems[$translation['column_name']] = $translation['value'];
            }
        }


        return $getTranslatedItems;
    }

    public static function page(Page $page): array
    {
        //$page = Page::where(['id'=>3,"status"=>"ACTIVE"])->with('translations')->first();
        return [
            'status'=>$page->status,
            'page_cover'=>Voyager::image($page->image),
            "seo"=>[
                'ar'=>[
                    'title'=>$page->title,
                    'excerpt'=>$page->excerpt,
                    'body'=>$page->body,
                    'slug'=>$page->slug,
                    'meta_description'=>$page->meta_description,
                    'meta_keywords'=>$page->meta_keywords,


                ],
                'en'=>Helper::toTranslation($page->translations)
           ]
        ];
    }
}
