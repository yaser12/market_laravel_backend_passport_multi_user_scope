<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes; // <-- This is required
class StockProduct extends Model
{
    use SoftDeletes;
    public $table = 'stock_products';

    protected $hidden = array('created_at', 'updated_at','deleted_at');
    public function stock(){
        return $this->belongsTo('App\Stock');
    }
    public function product(){
        return $this->belongsTo('App\Product');
    }
    public function stockProductCategory(){
        return $this->hasMany('App\StockProductCategory');
    }
    public function cart(){
        return $this->hasMany('App\Cart');
    }

}
