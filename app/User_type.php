<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class User_type extends Model
{
    //
    public $table = 'user_types';
    public $timestamps = false;

    public function users(){
        return $this->hasMany('App\User');
    }
}
