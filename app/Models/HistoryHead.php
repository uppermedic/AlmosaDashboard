<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use TCG\Voyager\Traits\Translatable;
class HistoryHead extends Model
{
    use HasFactory,Translatable;
    protected $table = 'history_heads';
    protected $translatable = ['title','description'];


    public function histories()
    {
        return $this->belongsToMany('App\Models\History','history_heads_relation','history_head_id','history_id');
    } 


}
