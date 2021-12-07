<?php

namespace App\Providers;

use App\FormFields\ServiceItemsField;
use Illuminate\Support\ServiceProvider;
use TCG\Voyager\Facades\Voyager;
use Illuminate\Support\Facades\URL;

class AppServiceProvider extends ServiceProvider
{
    /**
     * Register any application services.
     *
     * @return void
     */
    public function register()
    {
        //
        Voyager::addFormField(ServiceItemsField::class);
    }

    /**
     * Bootstrap any application services.
     *
     * @return void
     */
    public function boot(Url $url)
    {
        if(env('APP_ENV') !== 'local')
        {
            $url->forceSchema('https');
        }
    }
}
