<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\HasOne;
use TCG\Voyager\Traits\Translatable;
use Illuminate\Database\Eloquent\SoftDeletes;
//use Illuminate\Support\Facades\App;

class Event extends Model
{
    use HasFactory,Translatable,SoftDeletes;

    protected $translatable = ['title','content','speaker_name','location'];

    public function categories()
    {
        return $this->belongsTo('App\Models\EventCategory','event_category_id');
    }

    public function timelines(){
        return $this->hasOne('App\Models\EventTimeline');
    }
}
