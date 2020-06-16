<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class Favorite_ad extends Model
{

    public $table = 'favorite_ads';

    protected $hidden = array('created_at', 'updated_at','deleted_at');

    public function product(){
        return $this->belongsTo('App\Product');
    }
    public function user(){
        return $this->belongsTo('App\User');
    }
}
