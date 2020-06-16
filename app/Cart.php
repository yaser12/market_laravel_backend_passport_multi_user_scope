<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class Cart extends Model
{

    public $table = 'carts';

    protected $hidden = array('created_at', 'updated_at','deleted_at');

    public function stock_product(){
        return $this->belongsTo('App\StockProduct');
    }
    public function user(){
        return $this->belongsTo('App\User');
    }
}
