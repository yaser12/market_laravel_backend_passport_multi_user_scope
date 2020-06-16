<?php

namespace App\Http\Controllers;

use App\Previewd;
use Illuminate\Http\Request;

class previewdsController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        //
        $previewdCars = Previewd::all()->toArray();
        return response()->json(array('json' => $previewdCars), 200);
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
        $previewdCar = Previewd::find($id);
        return response()->json(array('json' => $previewdCar), 200);
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
        $previewdCar = Previewd::find($id);
        $previewdCar->delete();
    }

    /**
     * Display the previewd cars for specified user.
     *
     * @param  int  $user_id
     * @return \Illuminate\Http\Response
     */
    public function getUserPreviewdCars_ids($user_id)
    {
        //
        $previewdCars_ids = Previewd::select('car_product_id')->where('user_id', $user_id)->get();
        return response()->json(array('json' => $previewdCars_ids), 200);
    }
}
