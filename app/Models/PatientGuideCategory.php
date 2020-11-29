<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use TCG\Voyager\Traits\Translatable;
class PatientGuideCategory extends Model
{
    use HasFactory,Translatable;

    protected $translatable = ['category_name'];
    protected $fillable = ['category_name','bg_image','bg_color'];
}
