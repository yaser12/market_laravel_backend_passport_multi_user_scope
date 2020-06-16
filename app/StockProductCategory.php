<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class StockProductCategory extends Model
{
    public $table = 'stock_product_categories';
    protected $hidden = array('created_at', 'updated_at','deleted_at');

    public function stockProduct(){
        return $this->belongsTo('App\StockProduct');
    }
    public function category(){
        return $this->belongsTo('App\Category');
    }
}
