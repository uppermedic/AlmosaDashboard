<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use TCG\Voyager\Traits\Translatable;
use Illuminate\Database\Eloquent\SoftDeletes;
class EventCategory extends Model
{
    use HasFactory,Translatable,SoftDeletes;
    protected $translatable = ['name'];
}
