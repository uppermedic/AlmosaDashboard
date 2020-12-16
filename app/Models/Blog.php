<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use TCG\Voyager\Traits\Translatable;
use Laravel\Scout\Searchable;
class Blog extends Model
{
    use HasFactory ,Translatable,Searchable;
    protected $translatable = ['title','slug','content','excerpt'];


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

}
