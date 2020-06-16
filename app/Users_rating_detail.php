<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Users_rating_detail extends Model
{
    //
    public $table = 'user_types';
    public $timestamps = false;

    public function rated_user(){
        return $this->belongsTo('App\User','rated_user_id');
    }
    public function rating_user(){
        return $this->belongsTo('App\User','rating_user_id');
    }
}
