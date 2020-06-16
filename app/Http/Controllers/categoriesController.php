<?php

namespace App\Http\Controllers;

use App\Category;
use App\Category_2_category;
use Illuminate\Http\Request;

class categoriesController extends Controller
{
    /**
     * view a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function view(Request $request)
    {
        //
//        $root = Category_2_category::select('son_id')->groupBy('son_id')->get();
//        $categories = Category::whereNotIn('id', $root)->get();
        $categories = Category::all();
        foreach ($categories  as &$category)
        {

            $category->setAttribute('parent', categoriesController:: get_parent($category->id));

        }
        $arr = Array('categories' => $categories);
        return view('category.categories', $arr);
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
        //
        $categories = Category::all();
        foreach ($categories  as &$category)
        {

            $category->setAttribute('parent',  $this->get_parent($category->id));

        }
        return response()->json(Array('json' => $categories));
    }
public function get_full_name_of_category($category_id)
{

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

        $new_category->tabe_site_photo = $request->input('tabe_site_photo');
        $new_category->mobile_site_photo = $request->input('mobile_site_photo');
        $new_category->pc_site_photo = $request->input('pc_site_photo');
        $new_category->show_pages = $request->input('show_pages');
        $new_category->size1_site_photo = $request->input('size1_site_photo');
        $new_category->size2_site_photo = $request->input('size2_site_photo');
        $new_category->size3_site_photo = $request->input('size3_site_photo');
        $new_category->size4_site_photo = $request->input('size4_site_photo');
        $new_category->size5_site_photo = $request->input('size5_site_photo');
        $new_category->size6_site_photo = $request->input('size6_site_photo');

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
    public static function get_parent($son_id){
        $parent_ids = Category_2_category::select('parent_id')->where('son_id', $son_id)->get();
        $parent_categories = Category::whereIn('id', $parent_ids)->get();
        $data=' ';
        foreach ($parent_categories  as &$category)
        {
            $data=$data.$category->category_name_ar.' -  ';
            $parent_parent_ids = Category_2_category::select('parent_id')->where('son_id', $category->id)->get();
            $parent_parent_categories = Category::whereIn('id', $parent_parent_ids)->get();
            foreach ($parent_parent_categories  as &$category1)
            {
                $data=$data.$category1->category_name_ar.' -  ';
                $parent_parent_parent_ids = Category_2_category::select('parent_id')->where('son_id', $category1->id)->get();
                $parent_parent_parent_categories = Category::whereIn('id', $parent_parent_parent_ids)->get();
                foreach ($parent_parent_parent_categories  as &$category2)
                {
                    $data=$data.$category2->category_name_ar.' -  ';
                    $parent_parent_parent_parent_ids = Category_2_category::select('parent_id')->where('son_id', $category2->id)->get();
                    $parent_parent_parent_parent_categories = Category::whereIn('id', $parent_parent_parent_parent_ids)->get();
                    foreach ($parent_parent_parent_parent_categories  as &$category3)
                    {
                        $data=$data.$category3->category_name_ar.' -  ';

                    }

                }


            }

        }
        return $data;

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
private function  get_category_sons($parent_id){
    $son_ids = Category_2_category::select('son_id')->where('parent_id', $parent_id)->get();
  return  $category_sons = Category::whereIn('id', $son_ids)->get();
}
    public function show_tree_sons_by_page_name($page_name)
    {

        $categories = Category::where('show_pages', 'LIKE', '%'.$page_name.'%')->get();
        foreach ($categories  as &$category)
        {

            $category_sons=  $this-> get_category_sons($category->id);
            foreach ($category_sons  as &$category_son)
            {
                $category_son_sons=  $this-> get_category_sons($category_son->id);
                foreach ($category_son_sons  as &$category_son_son_son)
                {
                    $category_son_son_sons=  $this-> get_category_sons($category_son_son_son->id);
                    foreach ($category_son_son_sons  as &$category_son_son_son_son)
                    {
                        $category_son_son_son_sons=  $this-> get_category_sons($category_son_son_son_son->id);
                        $category_son_son_son_son->setAttribute('sons', $category_son_son_son_sons);

                    }
                    $category_son_son_son->setAttribute('sons', $category_son_son_sons);

                }
                $category_son->setAttribute('sons', $category_son_sons);
            }
            $category->setAttribute('sons', $category_sons);
        }





        return response()->json(['categories' => $categories[0]], 200);


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
    public function view_by_page_name(  $page_name)
    {
        //
//        $root = Category_2_category::select('son_id')->groupBy('son_id')->get();
//        $categories = Category::whereNotIn('id', $root)->get();
        $categories = Category::where('show_pages', 'LIKE', '%'.$page_name.'%')->get();
        return response()->json(['categories' => $categories], 200);

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

                    'tabe_site_photo required',
                    'mobile_site_photo required',
                    'pc_site_photo required',
                    'show_pages required',
                    'size1_site_photo required',
                    'size2_site_photo required',
                    'size3_site_photo required',
                    'size4_site_photo required',
                    'size5_site_photo required',
                    'size6_site_photo required',


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
        $category->tabe_site_photo = $request->input('tabe_site_photo');
        $category->mobile_site_photo = $request->input('mobile_site_photo');
        $category->pc_site_photo = $request->input('pc_site_photo');
        $category->show_pages = $request->input('show_pages');
        $category->size1_site_photo = $request->input('size1_site_photo');
        $category->size2_site_photo = $request->input('size2_site_photo');
        $category->size3_site_photo = $request->input('size3_site_photo');
        $category->size4_site_photo = $request->input('size4_site_photo');
        $category->size5_site_photo = $request->input('size5_site_photo');
        $category->size6_site_photo = $request->input('size6_site_photo');
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
