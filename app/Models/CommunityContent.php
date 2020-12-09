<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;
use TCG\Voyager\Traits\Translatable;

class CommunityContent extends Model
{
    use HasFactory,SoftDeletes,Translatable;
    protected $translatable = ['title','content'];
}
