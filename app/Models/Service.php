<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;
use Laravel\Scout\Builder;
use TCG\Voyager\Traits\Translatable;

/**
 * Class Service
 * @package App\Models
 *
 * @property int $id
 * @property string $title
 *
 * @method static Builder|self whereId(int $id)
 */
class Service extends Model
{
    use HasFactory,Translatable,SoftDeletes;
    protected $hidden = ['id'];
    protected $table = 'services';
    protected $translatable = ['title','excerpt','content','slug','content2'];

    public function getSections()
    {
        return $this->hasMany(ServiceSection::class,'service_id');
    }

    public function doctors()
    {
        return $this->belongsToMany(Doctor::class, 'services_physicians_relation', 'service_id', 'doctor_id');
    }

    public static function getAllServices()
    {
        return self::get(['id','title']);
    }
}
