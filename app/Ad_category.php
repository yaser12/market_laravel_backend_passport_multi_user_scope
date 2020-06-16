<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Ad_category extends Model
{
    ////
    public $table = 'ad_categories';
    public $timestamps = false;

    public function car_products(){
        return $this->hasMany('App\Product');
    }
    public function special_ads(){
        return $this->hasMany('App\Special_ad');
    }
    public function ads_category_for_area_ads(){
        return $this->hasMany('App\Ads_category_for_area_ad');
    }
}
