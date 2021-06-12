<?php

namespace App\Models;

use Carbon\Carbon;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;
use PhpParser\Builder;
use TCG\Voyager\Models\Translation;
use TCG\Voyager\Traits\Translatable;

/**
 * Class ServiceSectionItem
 * @package App\Models
 *
 * @property int $section_id
 * @method static Builder|self whereId(int $id)
 */
class ServiceSectionItem extends Model
{
    use HasFactory,SoftDeletes,Translatable;
    protected $translatable = ['title','content'];
    protected $fillable = ['title','content','section_id'];

    const SECTION_TABLE = 'service_sections';
    const SERVICE_TABLE = 'services';

    /**
     * This function returns all required information about section and service that we're using
     *
     * @param $id
     * @return mixed
     */
    public static function getRequiredInfo($id)
    {
        return self::leftJoin('service_sections as t1','t1.id','=','service_section_items.section_id')
            ->leftJoin('services as t2','t2.id','=','t1.service_id')
            ->select('t1.color', 't1.title as sectionTitle', 't1.id as section_id', 't2.id as service_id', 't2.title as serviceTitle')
            ->where('service_section_items.id', $id)
            ->first();
    }

    public static function updateSectionItem($id , $sectionID)
    {
        return self::whereId($id)->update(['section_id' => $sectionID]);
    }

    public static function getSectionTranslate($id, $table)
    {
        return Translation::where(['foreign_key' => $id, 'column_name' => 'title', 'table_name' => $table])->value('value');
    }

    public static function getByService($serviceID)
    {
        $sections = ServiceSection::where('service_id',$serviceID)->get('id');
        $ids = [];
        foreach ($sections as $section) {
            $ids[] = $section->id;
        }
        return self::whereIn('section_id', $ids);
    }

    public static function updateSorting($id, $sortingID)
    {
        return self::whereId($id)->update(['sorting_number' => $sortingID, 'updated_at' => Carbon::now()]);
    }

}
