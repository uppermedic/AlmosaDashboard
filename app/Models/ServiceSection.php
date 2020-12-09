<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;
use TCG\Voyager\Traits\Translatable;

class ServiceSection extends Model
{
    use HasFactory,SoftDeletes,Translatable;

    protected $translatable = ['title'];


    public function items()
    {
        return $this->hasMany('App\Models\ServiceSectionItem','section_id');
    }

    public function getService()
    {
        return $this->belongsTo('App\Models\Service','service_id');
    }
}
