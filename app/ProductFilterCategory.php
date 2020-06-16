<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class ProductFilterCategory extends Model
{
    public $table = 'product_filter_categories';
    protected $hidden = array('created_at', 'updated_at','deleted_at');

    public function product(){
        return $this->belongsTo('App\Product');
    }
    public function category(){
        return $this->belongsTo('App\Category');
    }
}
