<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use TCG\Voyager\Traits\Translatable;
class PatientGuid extends Model
{
    use HasFactory,Translatable;

    protected $translatable = ['title','content'];
}
