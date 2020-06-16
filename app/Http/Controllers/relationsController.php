<?php

namespace App\Http\Controllers;

use App\Category;
use App\Category_region;
use App\Category_user;
use App\Region;
use App\Region_user;
use App\User;
use Illuminate\Http\Request;

class relationsController extends Controller
{
    //
    public function view_cat2reg()
    {
        //
        $regions = Region::all();
        $categories = Category::all();
        $arr = Array('regions' => $regions, 'categories' => $categories);
        return view('relations.category_2_region', $arr);
    }
    public function view_cat2user()
    {
        //
        $categories = Category::all();
        $users = User::all();
        $arr = Array('categories' => $categories, 'users' => $users);
        return view('relations.category_2_user', $arr);
    }
    public function view_reg2user()
    {
        //
        $regions = Region::all();
        $users = User::all();
        $arr = Array('regions' => $regions, 'users' => $users);
        return view('relations.region_2_user', $arr);
    }
    public function get_favorite_categories_for_region($region_id)
    {
        //
        $region = Region::find($region_id);
        return response()->json(Array('json'=>$region->categories));
    }
    public function get_favorite_regions_for_category($category_id)
    {
        //
        $category = Category::find($category_id);
        return response()->json(Array('json'=>$category->regions));
    }
    public function get_favorite_users_for_category($category_id)
    {
        //
        $category = Category::find($category_id);
        return response()->json(Array('json'=>$category->users));
    }
    public function get_favorite_categories_for_user($user_id)
    {
        //
        $user = User::find($user_id);
        return response()->json(Array('json'=>$user->categories));
    }
    public function get_favorite_users_for_region($region_id)
    {
        //
        $region = Region::find($region_id);
        return response()->json(Array('json'=>$region->users));
    }
    public function get_favorite_regions_for_user($user_id)
    {
        //
        $user = User::find($user_id);
        return response()->json(Array('json'=>$user->regions));
    }
    public function store_cat2reg(Request $request)
    {
        //
        $new_rel = new Category_region();
        $new_rel->region_id = $request->input('region_id');
        $new_rel->category_id = $request->input('category_id');
        $new_rel->save();
        return 'true';
    }
    public function store_cat2user(Request $request)
    {
        //
        $new_rel = new Category_user();
        $new_rel->user_id = $request->input('user_id');
        $new_rel->category_id = $request->input('category_id');
        $new_rel->save();
        return 'true';
    }
    public function store_reg2user(Request $request)
    {
        //
        $new_rel = new Region_user();
        $new_rel->user_id = $request->input('user_id');
        $new_rel->region_id = $request->input('region_id');
        $new_rel->save();
        return 'true';
    }
}
