<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use TCG\Voyager\Traits\Translatable;
use Laravel\Scout\Searchable;
class Blog extends Model
{
    use HasFactory ,Translatable,Searchable;
    protected $translatable = ['title','slug','content','excerpt','canonical_link','seo_title','meta_description','meta_keywords'];


    /**
     *  store the index of scout for searching
     * @return string
     */
    public function searchableAs()
    {
        return 'blog_index';
    }
    public function toSearchableArray(): array
    {
        // Customize array...

        return $this->toArray();
    }

    public function categories()
    {
        return $this->belongsToMany('App\Models\BlogCategory','blogs_categories_relation','blog_id','blog_category_id');
    }

    public function tags()
    {
        return $this->belongsToMany('App\Models\BlogTag','blogs_tags_relation','blog_id','blog_tag_id');
    }
}
