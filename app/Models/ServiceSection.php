<?php

namespace App\Models;

use Carbon\Carbon;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;
use Laravel\Scout\Builder;
use TCG\Voyager\Traits\Translatable;

/**
 * Class ServiceSection
 * @package App\Models
 *
 * @property int $id
 * @property string $title
 * @property string $color
 * @property int $service_id
 *
 * @method static Builder|self whereId(int $id)
 */

class ServiceSection extends Model
{
    use HasFactory,SoftDeletes,Translatable;

    protected $translatable = ['title','canonical_link','meta_title','meta_description'];
    protected $fillable = ['title','service_id'];
    protected $attributes = ['color' => '#000000'];


    public function items()
    {
        return $this->hasMany('App\Models\ServiceSectionItem','section_id');
    }

    public function getService()
    {
        return $this->belongsTo('App\Models\Service','service_id');
    }

    public static function relatedSections($serviceId) {
        return self::where('service_id', $serviceId)->whereNull('deleted_at')->get(['id', 'title']);
    }

    public static function updateSection($sectionID, $serviceID, $color)
    {
        $update = self::whereId($sectionID)->update(array('service_id' => $serviceID, 'color' => $color));
        if (!$update) {
            throw new \Exception("Couldn't update the service's section");
        }
    }

    public static function updateSorting($id, $sortingID)
    {
        return self::whereId($id)->update(['sorting_number' => $sortingID, 'updated_at' => Carbon::now()]);
    }
}
