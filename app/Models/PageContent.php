<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;
use TCG\Voyager\Traits\Translatable;
class PageContent extends Model
{
    use HasFactory,Translatable,SoftDeletes;

    protected $translatable= ['title','content'];

    public function getPages()
    {
        return $this->belongsToMany(Page::class, 'page_content_relation', 'page_content_id', 'page_id');
    }

    public function pageItems()
    {
        return $this->belongsToMany(PageItem::class, 'page_content_page_items', 'page_content_id', 'page_item_id');
    }
}
