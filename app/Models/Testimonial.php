<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use TCG\Voyager\Traits\Translatable;

class Testimonial extends Model
{
    use HasFactory, Translatable;
    
    protected $translatable = ['body', 'patient_name', 'dr_name', 'department'];
    protected $fillable = ['body', 'patient_name', 'dr_name', 'department'];
}
