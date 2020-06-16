<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Special_ad extends Model
{
    //
    public $table = 'special_ads';
    public $timestamps = false;

    public function car(){
        return $this->belongsTo('App\Product');
    }
    public function ad_category(){
        return $this->belongsTo('App\Ad_category');
    }
}
