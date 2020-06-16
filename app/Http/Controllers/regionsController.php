<?php

namespace App\Http\Controllers;

use App\Latlong_region;
use App\Region;
use App\Region_type;
use Illuminate\Http\Request;

class regionsController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function view()
    {
        //
        $regions = Region::where('parent_region_id', 0)->get();
        $region_types = Region_type::all();
        $arr = Array('regions' => $regions, 'region_types' => $region_types);
        return view('region.regions', $arr);
    }

    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function getall()
    {
        //
        $regions = Region::all();
        $arr = Array('regions' => $regions);
        return response()->json(array('json' => $regions), 200);
    }

    /**
     * get a listing of the resource by Level.
     *
     * @return \Illuminate\Http\Response
     */
    public function get_data_ajax_by_level_and_parent($lvl, $parent_project_id)
    {
        //
        $regions = Region::where('parent_region_id', $parent_project_id)->get();
        $region_types = Region_type::all();
        $arr = Array('regions' => $regions, 'region_types' => $region_types, 'parent_id' => $parent_project_id, 'lvl' => $lvl);
        return view('region.son', $arr);
    }

    /**
     * return a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        //
        $regions = Region::all()->toArray();
        return response()->json(array('json' => $regions), 200);
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
     * @param \Illuminate\Http\Request $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        //
        $this->validate($request, [
            'description' => 'required',
            'is_verified_from_us' => 'required',
            'parent_region_id' => 'required',
            'region_name_ar' => 'required',
            'region_name_en' => 'required',
            'region_type_id' => 'required',
            'lat' => 'required',
            'long' => 'required',
        ]);
        $new_region = new Region();
        $new_region->description = $request->input('description');
        $new_region->is_verified_from_us = $request->input('is_verified_from_us');
        $new_region->parent_region_id = $request->input('parent_region_id');
        $new_region->region_name_ar = $request->input('region_name_ar');
        $new_region->region_name_en = $request->input('region_name_en');
        $new_region->region_type_id = $request->input('region_type_id');
        $new_region->save();
        $lat_lng = new Latlong_region();
        $lat_lng->region_lat = $request->input('lat');
        $lat_lng->region_long = $request->input('long');
        $lat_lng->region_id = $new_region->id;
        $lat_lng->save();
        $arr = Array('region' => $new_region, 'lvl' => $request->input('lvl'));
        return view('region.addoption', $arr);
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
        $project_region = Region::find($id);
        return response()->json(array('json' => $project_region), 200);
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param int $id
     * @return \Illuminate\Http\Response
     */
    public function edit(Request $request)
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
    public function update(Request $request)
    {
        //
        $new_region = Region::find($request->input('id'));
        $new_region->description = $request->input('description');
        $new_region->region_name_ar = $request->input('region_name_ar');
        $new_region->region_name_en = $request->input('region_name_en');
        $new_region->update();
        $latlong = Latlong_region::where('project_region_id', $request->input('id'))->first();
        $latlong->region_lat = $request->input('lat');
        $latlong->region_long = $request->input('long');
        $latlong->update();
        return response()->json(array('json' => $new_region, 'latlong' => $latlong), 200);
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
        $project_region = Region::find($request->input('del_region_id'));
        $region_latlng = Latlong_region::where('region_id', $request->input('del_region_id'))->first();
        $region_latlng->delete();
        $project_region->delete();
        return 'true';
    }
}
