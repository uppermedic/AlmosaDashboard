<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;
use TCG\Voyager\Traits\Translatable;
class Service extends Model
{
    use HasFactory,Translatable,SoftDeletes;
    protected $translatable = ['title','excerpt','content'];
}
