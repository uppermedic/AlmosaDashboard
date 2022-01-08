<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;
use TCG\Voyager\Traits\Translatable;
class PageItem extends Model
{
    use HasFactory,Translatable,SoftDeletes;

    protected $fillable = ['id','image','url','color','name','title','content','slug','canonical_link','meta_title','meta_description'];

    protected $translatable = ['name','title','content','slug','canonical_link','meta_title','meta_description'];

    public function section()
    {
        return $this->belongsTo(Section::class, 'section_id', 'id');
    }

    public function pageContents()
    {
        return $this->belongsToMany(PageContent::class, 'page_content_page_items', 'page_item_id', 'page_content_id');
    }
}
