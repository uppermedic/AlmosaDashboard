<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class EventAttendance extends Model
{
    use HasFactory,SoftDeletes;

    protected $fillable =
        [
            'firstName',
            'lastName',
            'city',
            'phone',
            'email',
            'speciality',
            'scfhs_no',
            'hospital',
            'position',
            'event_id'
        ];

    public function getEvent()
    {
        return $this->belongsTo('App\Models\Event', 'event_id', 'id');
    }
}
