<?php

namespace App\Http\Controllers;

use App\Favorite_ad;
use Illuminate\Http\Request;

class favoriteAdsController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        //
        $favoriteads = Favorite_ad::all()->toArray();
        return response()->json(array('json' => $favoriteads), 200);
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        //
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        //
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        //
        $favoritead = Favorite_ad::find($id);
        return response()->json(array('json' => $favoritead), 200);
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        //
        $favoritead = Favorite_ad::find($id);
        $favoritead->delete();
    }

    /**
     * Display the favorited ads for specified user.
     *
     * @param  int  $user_id
     * @return \Illuminate\Http\Response
     */
    public function getUserFavoriteCars_ids($user_id)
    {
        //
        $favoriteCars_ids = Favorite_ad::select('car_product_id')->where('user_id', $user_id)->get();
        return response()->json(array('json' => $favoriteCars_ids), 200);
    }
}
