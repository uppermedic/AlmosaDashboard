<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;
use TCG\Voyager\Traits\Translatable;
class PageItem extends Model
{
    use HasFactory,Translatable,SoftDeletes;

    protected $translatable= ['name','title','content'];
}
