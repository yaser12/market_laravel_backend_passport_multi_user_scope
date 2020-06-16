<?php

namespace App\Http\Controllers;

use App\Region;
use App\Region_type;
use Illuminate\Http\Request;

class regionTypesController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function view()
    {
        //
        $regions = Region::all();
        $region_types = Region_type::all();
        $arr = Array('region_types' => $region_types);
        return view('region.region_types', $arr);
    }
    /**
     * get a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        //
        $region_types = Region_type::all();
        return response()->json(array('region_type' => $region_types), 200);
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        //

        $regions = Region::all();
        $arr = Array('regions' => $regions);
        return response()->json(array('json' => $regions), 200);
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param \Illuminate\Http\Request $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        //
        $new_regiontype = new Region_type();
        $new_regiontype->is_verified_from_us = $request->input('is_verified_from_us');
        $new_regiontype->region_type_name_ar = $request->input('region_type_name_ar');
        $new_regiontype->region_type_name_en = $request->input('region_type_name_en');
        $new_regiontype->save();
        return response()->json(array('json' => $new_regiontype), 200);
    }

    /**
     * Display the specified resource.
     *
     * @param int $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        //
        $region_type = Region_type::find($id);
        return response()->json(array('json' => $region_type), 200);
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param int $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param \Illuminate\Http\Request $request
     * @param int $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param int $id
     * @return \Illuminate\Http\Response
     */
    public function destroy(Request $request)
    {
        //
        $region_type = Region_type::find($request->input('del_region_id'));
        $region_type->delete();
    }
}
