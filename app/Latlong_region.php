<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Latlong_region extends Model
{
    //
    public $timestamps = false;

    public function region(){
        return $this->belongsTo('App\Region');
    }
}
