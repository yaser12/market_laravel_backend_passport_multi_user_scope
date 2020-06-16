<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
///
class Area_ad extends Model
{
    //
    public $table = 'area_ads';
    public $timestamps = false;

    public function ads_category_for_area_ads(){
        return $this->hasMany('App\Ads_category_for_area_ad');
    }
}
