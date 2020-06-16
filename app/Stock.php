<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Stock extends Model
{
    public function stockProduct(){
        return $this->hasMany('App\StockProduct');
    }
}
