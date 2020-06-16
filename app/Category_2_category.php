<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Category_2_category extends Model
{
    //
    public $timestamps = false;
    public $table = 'category_2_category';

    public function parent_category(){
        return $this->belongsTo('App\Category','parent_id');
    }

    public function son_category(){
        return $this->belongsTo('App\Category','son_id');
    }
}
