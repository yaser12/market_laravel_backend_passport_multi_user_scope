<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Region extends Model
{
    //
    public $timestamps = false;
    protected $hidden = array('created_at', 'updated_at','deleted_at');

    public function region_type(){
        return $this->belongsTo('App\Region_type');
    }

    public function latlong_region(){
        return $this->hasOne('App\Latlong_region');
    }

    public function categories(){
        return $this->belongsToMany('App\Category');
    }

    public function users(){
        return $this->belongsToMany('App\User');
    }
}
