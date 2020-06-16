<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Ads_category_for_area_ad extends Model
{
    //
    public $table = 'ads_category_for_area_ads';
    public $timestamps = false;

    public function ad_category(){
        return $this->belongsTo('App\Ad_category');
    }
}
