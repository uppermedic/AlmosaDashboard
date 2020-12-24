<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
/*use TCG\Voyager\Traits\Translatable;*/
class PhotoGallery extends Model
{
    use HasFactory;
   /* protected $translatable = ['title'];*/

    public function category()
    {
        return $this->belongsTo('App\Models\PhotoCategory','photo_category_id');
    }
}
