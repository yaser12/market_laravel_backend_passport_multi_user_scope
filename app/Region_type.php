<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Region_type extends Model
{
    //
    public $timestamps = false;

    public function project_region(){
        return $this->hasOne('App\Region');
    }
}
