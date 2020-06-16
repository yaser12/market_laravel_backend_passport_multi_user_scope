<?php

namespace App\Http\Controllers;

use App\Category;
use App\Category_2_category;
use App\Favorite_ad;
use App\Product;
use App\Category__product;
use App\Option;
use App\ProductFilterCategory;
use App\ProductsPhoto;
use App\Specification;
use App\StockProduct;
use App\StockProductCategory;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class productsController extends Controller
{

    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */

    public function stock_products($category_id)
    {


           $category_son_ids = Category_2_category::select('son_id')->where('parent_id', $category_id)->get();
           $category_son_ids = json_decode($category_son_ids, true);


        foreach ($category_son_ids  as &$category_son_id)
        {

                 $category_son_son_ids = Category_2_category::select('son_id')->where('parent_id', $category_son_id)->get();
            foreach ($category_son_son_ids  as &$category_son_son_id)
            {
                $category_son_son_son_ids = Category_2_category::select('son_id')->where('parent_id', $category_son_son_id)->get();

                foreach ($category_son_son_son_ids  as &$category_son_son_son_id)
                {
                    array_push($category_son_ids, [ 'son_id'=> $category_son_son_son_id   ]);

                }
                array_push($category_son_ids,  $category_son_son_id  );
            }
        }


        $current_category_id= [
            'son_id'=> $category_id
        ];
        array_push($category_son_ids,$current_category_id);
        $all_category_ids=[];
        foreach ($category_son_ids  as &$category_son_id)
        {

            $all_category_ids[count($all_category_ids)]=$category_son_id['son_id'];
        }

               $productFilterCategories = ProductFilterCategory::select('product_id')->whereIn('category_id', $all_category_ids)->get ();


            $all_Products=[];

        foreach ($productFilterCategories  as &$productFilterCategory)
        {
                $products =Product::where('id', $productFilterCategory->product_id)->get();
                foreach ($products  as &$product)
                {
                $productPhotos = ProductsPhoto::where('product_id', $product->id)->get();
                $product->setAttribute('productPhotos', $productPhotos);
                $stockProducts = StockProduct::where('product_id', '=', $product->id)->get();
                $product->setAttribute('stockProducts', $stockProducts);
                    $all_Products=   $this-> add_on_product_to_all_products($all_Products,$products);
            }
        }
        return $all_Products;

    }
    private  function  add_on_product_to_all_products($all_Products,$products)
    {
        foreach ($products  as &$product1)
        {
            $not_foundproduct1=true;
            foreach ($all_Products  as &$product2)
            {
                if($product1->id==$product2->id)
                {
                    $not_foundproduct1=false;
                }
            }
          if($not_foundproduct1)
            {
                array_push($all_Products, $product1);
            }
        }
return $all_Products;
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {

    }

    public  function  getFullNameOfCategory($category_id)
    {

    }
    /**
     * Display a add view
     *
     * @return \Illuminate\Http\Response
     */
    public function view()
    {
        //
        $categories = Category::all();
        foreach ($categories  as &$category)
        {

            $category->setAttribute('parent', categoriesController:: get_parent($category->id));

        }
        $arr = Array('categories' => $categories);

        return view('product.add', $arr);
    }
    public function delete_stockProduct(Request $request,$stockProduct_id)
    {
        try{
            return     DB::transaction(function () use ($request,$stockProduct_id)
            {
        $stockProduct = StockProduct::where('id', $stockProduct_id)->first();

        $product=Product::where('id', $stockProduct->product_id)->first();
        $productPhotos=ProductsPhoto::where('product_id', $product->id)->delete();
        $stockProducts= StockProduct::where('id', $stockProduct_id)->get();
        $stockProductCategories = StockProductCategory::where('stock_product_id', $stockProduct->id)->get();

                $stockProduct::where('product_id', $product->id)->delete();
                $product->delete();

             return   $this->showproducts(1);
            }); } catch (\Exception $e) {
                DB::rollback();
                return "error".$e;
            }
    }
    public function full_product_details(Request $request,$product_id)
    {

        $product=Product::where('id',$product_id)->first();
     if($request->user() && $request->user()->id)
     {
         $favorite_ad=   Favorite_ad::where("product_id",$product_id)->where("user_id",$request->user()->id)->first();
         if(!$favorite_ad)
         {
             $product->setAttribute('is_favorit',false);

         }else
         {
             $product->setAttribute('is_favorit',true);
         }
     }
     else{
         $product->setAttribute('is_favorit',false);
     }


           $productPhotos=ProductsPhoto::where('product_id', $product->id)->with('category') -> groupBy('category_id')->get();


        foreach ($productPhotos  as &$productPhoto)
        {
               $category = Category::where('id', $productPhoto->category_id )->first();

              $productPhoto->setAttribute('category', $category->category_name_ar);
              $forcurrentphoto_stockProductCategories=StockProductCategory::where('category_id', $productPhoto->category_id)
                -> groupBy('stock_product_id')

            ->
            get(); //  get product with category equals photo category
           $all_stockProduct_forcurrentphoto=[];
            foreach($forcurrentphoto_stockProductCategories as  &$forcurrentphoto_stockProductCategory)
            {

                        $forcurrentphoto_stockProduct=StockProduct::   where('id', $forcurrentphoto_stockProductCategory->stock_product_id)
                            -> where('product_id', $product->id)
                    ->first();

                if(  $forcurrentphoto_stockProduct !="") {

                    $forcurrentphoto_forcurrentstockproduct_stockProductCategories
                        =
                        StockProductCategory::where('stock_product_id', '=', $forcurrentphoto_stockProduct->id)->

                        with('category')
                            ->with(array('category'=> function ($query)  use ($productPhoto) {
                                $query->where('id','!=' ,  $productPhoto->category_id);
                    }))->get();

                        $forcurrentphoto_stockProduct->setAttribute('features', $forcurrentphoto_forcurrentstockproduct_stockProductCategories);


                    array_push($all_stockProduct_forcurrentphoto, $forcurrentphoto_stockProduct);
                }
            }
               $productPhotosall=ProductsPhoto::where('product_id','=', $product->id)->where('category_id','=' ,$productPhoto->category_id)->get();

            $productPhoto->setAttribute('photos', $productPhotosall);
                 $productPhoto->setAttribute('all_product_in_stock', $all_stockProduct_forcurrentphoto);

        }

        return $product->setAttribute('photo_by_color', $productPhotos);


    }

    public  function  showproducts($stokc_id)
    {
        if(!$stokc_id)$stokc_id=0;
        $stockProducts = StockProduct::where('stock_id', $stokc_id)->get();

        foreach ($stockProducts  as &$stockProduct)
        {
            $product=Product::where('id', $stockProduct->product_id)->first();
            $productPhotos=ProductsPhoto::where('product_id', $product->id)->get();
            $product->setAttribute('productPhotos',$productPhotos);

            $stockProductCategories=StockProductCategory::where('stock_product_id', $stockProduct->id)->get();
            foreach ($stockProductCategories  as &$stockProductCategory)
            {
                $category = Category::where('id', $stockProductCategory->category_id )->first();

                $stockProductCategory->setAttribute('category', $category->category_name_ar);
            }
            $stockProduct->setAttribute('product', $product);
            $stockProduct->setAttribute('stockProductCategories', $stockProductCategories);
        }
        $arr = Array('stockProducts' => $stockProducts);

        return view('product.showproducts', $arr);
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param \Illuminate\Http\Request $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        $data = $request->except('_token');
        $product_Rules = [
            'price' => 'required',
            'name_ar' => 'required'
        ];
        $this->validate($request, $product_Rules);
        try{
            return     DB::transaction(function () use ($request,$data)
            {

                $product = new Product();
        $product->price  = $request->input('price');
        $product->     showed_price = $request->input('showed_price');
        $product->note_ar = $request->input('note_ar');
        $product->note_en = $request->input('note_en');
        $product->newprice  = $request->input('newprice');
        $product->name_ar = $request->input('name_ar');
        $product->name_en = $request->input('name_en');
        $product->email = $request->input('email');
        $product->phonenumber = $request->input('phonenumber');
        $product->whats_phone = $request->input('whats_phone');
        $product->address = $request->input('address');
        $product->description_text = $request->input('description_text');
        $product->save();
      //  echo " <br> product = ".$product;
        $stock_number="";
        $cat_category_4_product_in_stock_arr=array();
        $stockProduct  =null;
        $stock_product_number=-1;
        foreach ($data as $key => $value) {
        if($value==null) continue;

            $perfix_imag="input_colored_prducts_img_path_";
            if(strpos($key,$perfix_imag)!==false)
            {
                $cat_id=substr($key,strripos($key,"_")+1);

                $productsPhoto   = new  ProductsPhoto();
                $productsPhoto->category_id=$cat_id;
                $productsPhoto->product_id=$product->id;
                $productsPhoto->product_photo_path=$value;
                $productsPhoto->save();
               // echo " <br> productsPhoto = ".$productsPhoto;

            }
            $prefix_stock_product_number= "stock_number_";


            if(strpos($key,$prefix_stock_product_number)!==false)
            {
                $stock_product_number=$value;

            }
            $prefix_stock_id= "stock_id_";

            {

                if( strpos($key,$prefix_stock_id)!==false

                ){

                    $stock_id=$value;

                    $stockProduct  = new  StockProduct();
                    $stockProduct->product_id=$product->id;
                    $stockProduct->stock_id=$stock_id;
                    $stockProduct->number_in_stock=$stock_product_number;
                    $stockProduct->save();
                    $stock_product_number=-1;
                  //  echo "  <br>  stockProduct = ".$stockProduct;
                }

            }


            $prefix_stock_product_category="cat_category_4_product_in_stock_";

            // save row in  stock_product_categories table
            if(
            strpos($key,$prefix_stock_product_category)!==false
                &&
            $stockProduct
            )
            {
            $stockProductCategory=    new StockProductCategory();
                $stockProductCategory->category_id =$value;
                $stockProductCategory->stock_product_id=$stockProduct->id;
                $stockProductCategory->save();
              //  echo "  <br>   stockProductCategory = ".$stockProductCategory;
            }
            $prefix_productFilterCategory="filter_categories_";

            if(
                strpos($key,$prefix_productFilterCategory)!==false
            )
            {
                $productFilterCategory   =   new     ProductFilterCategory();
                $productFilterCategory->product_id=$product->id;
                $productFilterCategory->category_id=$value;
                $productFilterCategory->save();
              //  echo "  <br>  productFilterCategory = ".$productFilterCategory;
            }



        }


                return "success";
            });

        } catch (\Exception $e) {
            DB::rollback();
            return "error".$e;
        }

    }

    /**
     * Display the specified resource.
     *
     * @param int $id
     * @return \Illuminate\Http\Response
     */
    public function show($lang, $id)
    {

        $carproduct = Product::find($id);
        return response()->json(['json' => $carproduct], 200);

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
    public function destroy($id)
    {
        //
        $carproduct = Product::find($id)->first();
        $carproduct->delete();
    }

}
