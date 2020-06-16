<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Notification extends Model
{
    //
    public $table = 'notifications';
    public $timestamps = false;

    public function user(){
        return $this->belongsToMany('App\User');
    }
}
