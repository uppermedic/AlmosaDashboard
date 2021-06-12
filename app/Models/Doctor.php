<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use TCG\Voyager\Traits\Translatable;
use App\Models\Section;
class Doctor extends Model
{
    use HasFactory,Translatable;

    protected $translatable =  ['slug','name','title','qualifications','current_positions'];

    protected $fillable = ['slug','name','title','qualifications','current_positions','image'];
    
    public function section()
    {
        return $this->hasOne(Section::class);
    }
}
