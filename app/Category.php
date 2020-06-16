<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Category extends Model
{
    //
    public $timestamps = false;
    protected $hidden = array('created_at', 'updated_at','deleted_at');

    public function car_products(){
        return $this->belongsToMany('App\Product');
    }

    public function category_type(){
        return $this->belongsTo('App\Category_type');
    }

    public function sons(){
        return $this->hasMany('App\Category_2_category', 'parent_id');
    }

    public function parents(){
        return $this->hasMany('App\Category_2_category', 'son_id');
    }

    public function regions(){
        return $this->belongsToMany('App\Region');
    }

    public function users(){
        return $this->belongsToMany('App\User');
    }
}
