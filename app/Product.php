<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class Product extends Model{
    use SoftDeletes;
    public $table = 'products';
    protected $hidden = array('created_at', 'updated_at','deleted_at');

    public function product_photo(){
        return $this->hasMany('App\ProductsPhoto');
    }
    public function stockProduct(){
        return $this->hasMany('App\StockProduct');
    }
    public function productFilterCategory()
    {
        return $this->hasMany('App\ProductFilterCategory');

    }

    public function previewdProduct(){
        return $this->hasMany('App\PreviewdProduct');
    }
    public function special_ads(){
        return $this->hasMany('App\Special_ad');
    }
    public function ad_category(){
        return $this->belongsTo('App\Ad_category');
    }
    public function user(){
        return $this->belongsTo('App\User');
    }
    public function favorite_ads(){
        return $this->hasMany('App\Favorite_ad');
    }

}
