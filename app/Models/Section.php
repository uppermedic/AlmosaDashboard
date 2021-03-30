<?php

namespace App\Models;


use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;
use TCG\Voyager\Traits\Translatable;
use App\Models\Doctor;

class Section extends Model
{
    use HasFactory,SoftDeletes,Translatable;

    protected $translatable = ['title'];
    protected $fillable = ['doctor_id', 'title'];


    public function doctors()
    {
        return $this->hasOne(Doctor::class);
    }

}
