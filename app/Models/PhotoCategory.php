<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;
use TCG\Voyager\Traits\Translatable;
class PhotoCategory extends Model

{
    use HasFactory,Translatable,SoftDeletes;

    protected $translatable = ['title'];

    public function getPhotos()
    {
        return $this->hasOne('App\Models\PhotoGallery', 'photo_category_id');
    }
}
