<?php


namespace App\Http\Controllers;
use App\Cart;
use App\Category;
use App\Favorite_ad;
use App\Order;
use App\Product;
use App\ProductFilterCategory;
use App\ProductsPhoto;
use App\StockProduct;
use App\StockProductCategory;
use Carbon\Carbon;

use App\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class UserController extends Controller
{
     public function  getUserProfile(Request  $request)
     {
         $user = User::Where('id',  $request->user()->id)->first();
         return response()->json([ "user"=>$user],200);
     }

     public function  editUserProfile(Request  $request)
     {
         $user = User::Where('id',  $request->user()->id)->first();
         if($request-> name)    $user-> name=$request-> name;
         if($request-> password)        $user-> password=$request-> password;
         if($request-> password)        $user->c_password=$request-> password;
         if($request-> surname)          $user->surname=$request->surname;
         if($request-> surname)           $user->email=$request->email;
         if($request-> gender)           $user-> gender=$request-> gender;
         if($request-> mobile_phone)           $user-> mobile_phone=$request-> mobile_phone;
         if($request-> birthDate)         $user->birthDate=$request->birthDate;
         if($request-> address)  $user->address=$request->address;
         $user->save();
         return $user;
     }
     public function  add_product_to_favorid(Request  $request,$product_id)
     {
          $favorite_ad=   Favorite_ad::where("product_id",$product_id)->where("user_id",$request->user()->id)->first();
          if(!$favorite_ad)
          {
              $favorite_ad=new   Favorite_ad();
              $favorite_ad->user_id=$request->user()->id;
              $favorite_ad->product_id=$product_id;
              $favorite_ad->save();


          }
         return response()->json([ "favorite_count"=>count(  Favorite_ad::where("user_id",$request->user()->id)->get())],200);

     }
    public function  delete_product_from_favorid(Request  $request,$product_id)
    {
        $favorite_ad=   Favorite_ad::where("product_id",$product_id)->where("user_id",$request->user()->id)->delete();

        return response()->json([ "favorite_count"=>count(  Favorite_ad::where("user_id",$request->user()->id)->get())],200);

    }

     public function  get_favorits(Request  $request)
     {
             $favorite_ad_product_ids=   Favorite_ad::  where("user_id",$request->user()->id)->get();

         $all_favorite_ad_product_ids=[];
         foreach ($favorite_ad_product_ids  as &$favorite_ad_product_id)
         {

             $all_favorite_ad_product_ids[count($all_favorite_ad_product_ids)]=$favorite_ad_product_id['product_id'];
         }

         $products = Product::whereIn('id', $all_favorite_ad_product_ids)->get();
         foreach ($products  as &$product) {
             $productPhotos = ProductsPhoto::where('product_id', $product->id)->get();
             $product->setAttribute('productPhotos', $productPhotos);
         }
         return response()->json([ "favorite_ads"=>$products],200);
     }
     public function  add_stack_product_to_cart(Request  $request,$stock_product_id)
     {
         $stack_product=StockProduct::where("id",'=',$stock_product_id)->first();
         if(!$stack_product)return ' no stack_product id ='.$stock_product_id;
         $cart=  Cart::where("stock_product_id",'=',$stock_product_id)->where("user_id",$request->user()->id)->first();

         {
             //try{
               //  return       DB::transaction(function () use ($request,$stock_product_id)  {

if($stack_product->number_in_cart<$stack_product->number_in_stock)
{
    $cart=new   Cart();
    $cart->user_id=$request->user()->id;

    $cart->stock_product_id =$stock_product_id;
    $cart->is_ordered=false;
    $cart->save();

    $stack_product=StockProduct::where("id",'=',$stock_product_id)->first();

        $stack_product->number_in_cart=$stack_product->number_in_cart+1;

    $stack_product->save();
}



              //   });
         //   } catch (\Exception $e) {              DB::rollback();              return "error".$e ;            }
          }
         return response()->json([ "cart_count"=>count(  Cart::where("user_id",$request->user()->id)->get())],200);

     }
     public  function  detet_stack_product_from_cart(Request  $request,$cart_id)
     {
         $cart=   Cart::where('id',$cart_id)-> where("user_id",$request->user()->id)->first();

         $stack_product=StockProduct::where("id",'=',$cart->stock_product_id)->first();

         $stack_product->number_in_cart=$stack_product->number_in_cart-1;

         $stack_product->save();
         $cart->delete();
         return $this->get_cart_details($request);
     }

    public function  get_order_details(Request  $request)
    {
        $carts=   Cart:: where("user_id",$request->user()->id)->where('is_ordered','=',true)->get();
        foreach ($carts  as &$cart)
        {

            $stockProduct = StockProduct::where('id', $cart->stock_product_id )->first();
            $product=Product::where('id', $stockProduct->product_id)->first();
            $stockProductCategories = StockProductCategory::where('stock_product_id', $stockProduct->id)->get();
            foreach ($stockProductCategories  as &$stockProductCategory)
            {
                $category = Category::where('id', $stockProductCategory->category_id )->first();

                $stockProductCategory->setAttribute('category', $category->category_name_ar);
            }
            $cart->setAttribute('stockProductCategories',$stockProductCategories);
            $cart->setAttribute('stockProduct', $stockProduct);
            $productsController=new productsController();
            $product=   $productsController-> full_product_details($request, $stockProduct->product_id);
            $productPhotos = ProductsPhoto::where('product_id', $product->id)->get();
            $product->setAttribute('productPhotos', $productPhotos);
            $cart->setAttribute('product', $product);

        }
        return response()->json([ "carts"=>$carts],200);
    }
     public function  get_cart_details(Request  $request)
{
    $carts=   Cart:: where("user_id",$request->user()->id)->where('is_ordered','=',false)->get();
    foreach ($carts  as &$cart)
    {

          $stockProduct = StockProduct::where('id', $cart->stock_product_id )->first();
        $product=Product::where('id', $stockProduct->product_id)->first();
          $stockProductCategories = StockProductCategory::where('stock_product_id', $stockProduct->id)->get();
        foreach ($stockProductCategories  as &$stockProductCategory)
        {
            $category = Category::where('id', $stockProductCategory->category_id )->first();

            $stockProductCategory->setAttribute('category', $category->category_name_ar);
        }
        $cart->setAttribute('stockProductCategories',$stockProductCategories);
        $cart->setAttribute('stockProduct', $stockProduct);
        $productsController=new productsController();
        $product=   $productsController-> full_product_details($request, $stockProduct->product_id);
        $productPhotos = ProductsPhoto::where('product_id', $product->id)->get();
        $product->setAttribute('productPhotos', $productPhotos);
        $cart->setAttribute('product', $product);

    }
    return response()->json([ "carts"=>$carts],200);
}
     public function get_cart(Request  $request)
     {

         $stockProducts=   Cart:: where("user_id",$request->user()->id)->where('is_ordered','=',false)->get();
         return response()->json([ "carts"=>$stockProducts],200);
         $all_stock_product_id_ids=[];

         foreach ($stock_product_ids  as &$stock_product_id)
         {

             $all_stock_product_id_ids[count($all_stock_product_id_ids)]=$stock_product_id['stock_product_id'];
         }
          $stockProducts = StockProduct::whereIn('id', $all_stock_product_id_ids)->get();


         foreach ($stockProducts  as &$stockProduct) {
             $products = Product::where('id', $stockProduct->product_id)->get();
             foreach ($products  as &$product) {
                 $productPhotos = ProductsPhoto::where('product_id', $product->id)->get();
                 $product->setAttribute('productPhotos', $productPhotos);
             }
             $stockProduct->setAttribute('Product', $products);
         }
         return response()->json([ "carts"=>$stockProducts],200);
     }
     public function  add_all_item_in_cart_to_order(Request  $request)
     {
         $order=new Order();
         $order->user_id=$request->user()->id;
         $order->save();
         $carts=   Cart:: where("user_id",$request->user()->id)->where('is_ordered','=',false)->get();
         foreach ($carts  as &$cart)
         {
             $cart->order_id=$order->id;
             $cart->is_ordered=true;
             $cart->save();
         }
         return $this->get_cart_details($request);
     }
     public function get_orders(Request  $request)
     {
         $stockProducts = Order:: where("user_id", $request->user()->id) ->get();
         return response()->json(["orders" => $stockProducts], 200);
         $all_stock_product_id_ids = [];

         foreach ($stock_product_ids as &$stock_product_id) {

             $all_stock_product_id_ids[count($all_stock_product_id_ids)] = $stock_product_id['stock_product_id'];
         }
         $stockProducts = StockProduct::whereIn('id', $all_stock_product_id_ids)->get();


         foreach ($stockProducts as &$stockProduct) {
             $products = Product::where('id', $stockProduct->product_id)->get();
             foreach ($products as &$product) {
                 $productPhotos = ProductsPhoto::where('product_id', $product->id)->get();
                 $product->setAttribute('productPhotos', $productPhotos);
             }
             $stockProduct->setAttribute('Product', $products);
         }
     }

}