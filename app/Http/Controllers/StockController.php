<?php

namespace App\Http\Controllers;

use App\Category;
use App\Category_2_category;
use App\Stock;
use Illuminate\Http\Request;

class StockController extends Controller
{
    /**
     * view a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function view(Request $request)
    {

    }

//    /**
//     * view a listing of the resource.
//     *
//     * @return \Illuminate\Http\Response
//     */
//    public function view_sons(Request $request)
//    {
//        //
//
//        $son_ids = Category_2_category::select('son_id')->where('parent_id', $request->input('parent_id'))->get();
//        $categories = Category::whereIn('id', $son_ids)->get();
//        $parent_id = Category_2_category::select('id')->where('parent_id', $request->input('parent_id'))->first()->id;
//        $arr = Array('categories' => $categories, 'parent_id' => $parent_id);
//        return view('category.son', $arr);
//    }

    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {

        $stocks = Stock::all();
        return response()->json(Array('json' => $stocks));
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        //
//        $data2 = Category::whereIn('id', $order)
//            ->orderByRaw(\DB::raw("FIELD(id, ".implode(",",$order).")"))
//            ->get();
        $parent_id = Category_2_category::select('id')->where('parent_id', 5)->first()->id;
        return response()->json(Array('json' => $parent_id));
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
        $new_category = new Category();
        $new_category->category_name_ar = $request->input('category_name_ar');
        $new_category->category_name_en = $request->input('category_name_en');
        $new_category->photo_path = $request->input('photo_path');
        $new_category->max_price_new = $request->input('max_price_new');
        $new_category->min_price_new = $request->input('min_price_new');
        $new_category->max_price_old = $request->input('max_price_old');
        $new_category->min_price_old = $request->input('min_price_old');
        $new_category->save();
        return response()->json(array('json' => $new_category));
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
        $category = Category::find($id);
        return response()->json(Array('json' => $category));
    }

    /**
     * Display the specified resources By Parent_id.
     *
     * @param int $id
     * @return \Illuminate\Http\Response
     */
    public function show_sons($parent_id)
    {
        //
        $son_ids = Category_2_category::select('son_id')->where('parent_id', $parent_id)->get();
        $data = Category::whereIn('id', $son_ids)->get();
        return response()->json(Array('json' => $data));
    }

    /**
     * index new parent to specified resource.
     *
     * @param int $id
     * @return \Illuminate\Http\Response
     */
    public function add_parent(Request $request)
    {
        //
        $new_rel = new Category_2_category();
        $new_rel->parent_id = $request->input('parent_id');
        $new_rel->son_id = $request->input('son_id');
        $new_rel->save();
        return 'true';
    }

    /**
     * remove parent to specified resource.
     *
     * @param int $id
     * @return \Illuminate\Http\Response
     */
    public function rem_parent(Request $request)
    {
        //
        $new_rel = Category_2_category::where('parent_id', $request->input('parent_id'))->where('son_id', $request->input('son_id'));
        $new_rel->delete();
        return 'true';
    }

    /**
     * Display the specified resources By Son_id.
     *
     * @param int $id
     * @return \Illuminate\Http\Response
     */
    public function show_parents($son_id)
    {
        //
        $parent_ids = Category_2_category::select('parent_id')->where('son_id', $son_id)->get();
        $data = Category::whereIn('id', $parent_ids)->get();
        return response()->json(Array('json' => $data));
    }

    /**
     * Display the specified resource By Parent_id.
     *
     * @param int $id
     * @return \Illuminate\Http\Response
     */
    public function show_root()
    {
        //
        $root = Category_2_category::select('son_id')->groupBy('son_id')->get();
        $category = Category::whereNotIn('id', $root)->get();
        return response()->json(Array('json' => $category));
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
        $category = Category::find($id);
        return response()->json(Array('name' => $category->category_name_ar,
            'required' =>
                ['category_name_ar required',
                    'category_name_en required',
                    'photo_path required',
                    'max_price_new required',
                    'min_price_new required',
                    'max_price_old required',
                    'min_price_old required'],
            'list' =>
                ['list']));
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
        $category = Category::find($request->input('id'));
        $category->category_name_ar = $request->input('category_name_ar');
        $category->category_name_en = $request->input('category_name_en');
        $category->photo_path = $request->input('photo_path');
        $category->max_price_new = $request->input('max_price_new');
        $category->min_price_new = $request->input('min_price_new');
        $category->max_price_old = $request->input('max_price_old');
        $category->min_price_old = $request->input('min_price_old');
        $category->update();
        return response()->json(Array('json' => $category));
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
        $cat = Category::find($request->input('del_category_id'));
        $rel = Category_2_category::where('son_id', $request->input('del_category_id'))->orWhere('parent_id', $request->input('del_category_id'))->get();
        for ($i = 0, $iMax = count($rel); $i < $iMax; $i++) {
            $rel->delete();
        }
        $cat->delete();
        return 'true';
    }
}
