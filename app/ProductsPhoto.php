<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class ProductsPhoto extends Model
{
    use SoftDeletes;
    //
    public $table = 'products_photos';
    protected $hidden = array('created_at', 'updated_at','deleted_at');

    public function product(){
        return $this->belongsTo('App\Product');
    }
    public function category(){
        return $this->belongsTo('App\Category');
    }
}
