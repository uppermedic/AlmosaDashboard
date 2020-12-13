<?php
/**
 * Email: aziz.adel.fci@gmail.com
 * User: aziz
 * Date: 12/13/20
 * Time: 11:31 AM
 */

namespace App\Http\Controllers\Api;

use TCG\Voyager\Facades\Voyager;

class Helper{
    public static function header()
    {
        return [
            'logo'=>Voyager::image(setting('site.logo')),
            'second_logo'=>Voyager::image(setting('site.second_logo')),
            'third_logo'=>Voyager::image(setting('site.third_logo')),
            'site_title'=>['ar'=>setting('site.title'),'en'=>setting('site.site_title_en')],
            'site_description'=>['ar'=>setting('site.description'),'en'=>setting('site.description_en')],
        ];
    }

    public static function footer()
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

    public static function toTranslation($translations)
    {
        $getTranslatedItems = [];
        foreach ($translations as $translation) {
            $getTranslatedItems[$translation['column_name']] = $translation['value'];
        }

        return $getTranslatedItems;
    }
}