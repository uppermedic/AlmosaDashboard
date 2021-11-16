<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;
use TCG\Voyager\Traits\Translatable;

class Community extends Model
{
    use HasFactory,Translatable,SoftDeletes;
    protected $translatable = ['title','slug','canonical_link','meta_title','meta_description'];


    public function contents()
    {
        return $this->belongsToMany('App\Models\CommunityContent','community_content_relation','community_id','community_content_id');
    }

    public function objectives()
    {
        return $this->belongsToMany('App\Models\Objective','communities_objectives_relations','community_id','objective_id');
    }

    public function participation()
    {
        return $this->belongsToMany('App\Models\ParticipatingGroup','communities_participating_relations','community_id','participating_group_id');
    }
}
