<?php

use Illuminate\Http\Request;
 
Route::middleware('auth:api')->get('/user', function (Request $request)
{
    return $request->user();
});

//Auth routes
Route::post('login', 'AuthController@login');
Route::post('login_user', 'AuthController@loginUser');
Route::post('register_user', 'AuthController@registerUser');
// Route for admin permissions
    Route::prefix('admin')->group(function() {
    Route::post('login', 'AuthController@loginAdmin');
    Route::post('register', 'AuthController@adminRegister');
});

Route::prefix('employeer')->group(function() {
    Route::post('login', 'AuthController@loginEmployeer');
    Route::post('register', 'AuthController@employeerRegister');
});

//////////////////////////// company location /////////////////////////////////////


Route::Post('signGoogle', 'Auth\LoginController@signWithGoogle');

Route::Post('signfacebook', 'Auth\LoginController@signWithFacebook');

////////////////////////////admins by  yaser ////////////////////////////////////////////

/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


/////////upload image////////////////////////////////////
Route::get('image-upload', 'imageUploadController@imageUpload')->name('image.upload');
Route::post('image-upload', 'imageUploadController@imageUploadPost')->name('image.upload.post');

//////////////////////////////////////// control panel
Route::get('routes', 'routesController@view');
Route::get('controlpanel', 'routesController@home');

//////////////////////////////////////// car products
Route::get('api/product/{id}', 'productsController@show');
Route::get('api/full_product_details/{id}', 'productsController@full_product_details');
Route::get('api/products/{category_id}', 'productsController@stock_products');

Route::get('addcarproduct', 'productsController@view');

Route::get('showproducts/{stokc_id}', 'productsController@showproducts');

Route::get('delete_stockProduct/{stockProduct_id}', 'productsController@delete_stockProduct');

Route::post('api/add-product', 'productsController@store')->name('add.product');

Route::post('api/delete-carproduct/{id}', 'productsController@destroy');
Route::get('/stocks', 'StockController@index') ;

//////////////////////////////////////// car products photos
Route::get('api/carproductsphoto/{id}', 'productsPhotosController@show');
Route::get('api/carproductsphotos', 'productsPhotosController@index');
Route::post('api/delete-carproductsphoto/{id}', 'productsPhotosController@destroy');

//////////////////////////////////////// previewdcars
Route::get('api/previewdcar/{id}', 'previewdsController@show');
Route::get('api/user-previewdcars-ids/{user_id}', 'previewdsController@getUserPreviewdCars_ids');
Route::get('api/previewdcars', 'previewdsController@index');
Route::post('api/delete-previewdcar/{id}', 'previewdsController@destroy');

//////////////////////////////////////// favorite_ads
Route::get('api/favoritead/{id}', 'favoriteAdsController@show');
Route::get('api/user-favoritecars-ids/{user_id}', 'getUserFavoriteCars_ids@getUserPreviewdCars_ids');
Route::get('api/favoriteads', 'favoriteAdsController@index');
Route::post('api/delete-favoritead/{id}', 'favoriteAdsController@destroy');

//////////////////////////////////////// users
Route::get('api/user/{id}', 'Auth.RegisterController@show');
Route::get('api/users', 'Auth.RegisterController@index');
Route::post('api/delete-user/{id}', 'Auth.RegisterController@destroy');

//////////////////////////////////////// user types
Route::get('api/usertype/{id}', 'userTypesController@show');
Route::get('api/usertypes', 'userTypesController@index');
Route::post('api/delete-usertype/{id}', 'userTypesController@destroy');

///////////////////////////////////////// regions

Route::get('regions', 'regionsController@view');
Route::get('api/regions', 'regionsController@create');
Route::get('api/region/{id}', 'regionsController@show');
Route::get('api/regionbyparent-level/{lvl}/{parent_project_id}', 'regionsController@get_data_ajax_by_level_and_parent');
Route::get('api/addregion', 'regionsController@store');
Route::get('api/editregion', 'regionsController@update');
Route::get('api/delregion', 'regionsController@destroy');

//////////////////////////////////////// region types
Route::get('regiontypes', 'regionTypesController@view');
Route::get('api/addregiontype', 'regionTypesController@store');
Route::get('api/delregiontype', 'regionTypesController@destroy');

//////////////////////////////////////// categories
Route::get('categories', 'categoriesController@view');
Route::get('api/categories/{page_name}', 'categoriesController@view_by_page_name')->middleware(['cors']);;;
Route::get('api/categories_tree_sons/{page_name}', 'categoriesController@show_tree_sons_by_page_name')->middleware(['cors']);;;

Route::get('categories_son', 'categoriesController@view_sons');
Route::get('api/addcategory', 'categoriesController@store');
Route::get('api/editcategory', 'categoriesController@update');
Route::get('api/deletecategory', 'categoriesController@destroy');
Route::get('api/categories', 'categoriesController@index')->middleware(['cors']);//->middleware(['auth:api', 'scope:admin,user']);;;
Route::get('api/category/{id}', 'categoriesController@show');
Route::get('api/categorysons/{parent_id}', 'categoriesController@show_sons');
Route::get('api/categoryparents/{son_id}', 'categoriesController@show_parents');
Route::get('api/categories/root', 'categoriesController@show_root');
Route::get('api/edit-categories/{id}', 'categoriesController@edit');
Route::get('api/add-parent', 'categoriesController@add_parent');
Route::get('api/rem-parent', 'categoriesController@rem_parent');
Route::get('api/cat/test', 'categoriesController@create');

//////////////////////////////////////// relations
Route::get('cat2reg/view', 'relationsController@view_cat2reg');
Route::get('cat2user/view', 'relationsController@view_cat2user');
Route::get('reg2user/view', 'relationsController@view_reg2user');
Route::get('rel/cat2reg/add', 'relationsController@store_cat2reg');
Route::get('rel/cat2user/add', 'relationsController@store_cat2user');
Route::get('rel/reg2user/add', 'relationsController@store_reg2user');
Route::get('api/categories-for-region/{region_id}', 'relationsController@get_favorite_categories_for_region');
Route::get('api/regions-for-category/{category_id}', 'relationsController@get_favorite_regions_for_category');
Route::get('api/categories-for-user/{user_id}', 'relationsController@get_favorite_categories_for_user');
Route::get('api/users-for-category/{category_id}', 'relationsController@get_favorite_users_for_category');
Route::get('api/users-for-region/{region_id}', 'relationsController@get_favorite_users_for_region');
Route::get('api/regions-for-user/{user_id}', 'relationsController@get_favorite_regions_for_user');

Auth::routes();

Route::get('/home', 'HomeController@index')->name('home');

Auth::routes();

Route::get('/home', 'HomeController@index')->name('home');
///////////////////////////////// accounts///////////////////////

Route::get('user_profile', 'UserController@getUserProfile')->middleware(['auth:api', 'scope:user'])  ;
Route::post('editUserProfile', 'UserController@editUserProfile')->middleware(['auth:api', 'scope:user'])  ;

///////////////////////////////////////////////////////////////// fav  ///////////////////
Route::post('add_product_to_favorid/{product_id}', 'UserController@add_product_to_favorid')->middleware(['auth:api', 'scope:user']);

Route::post('delete_product_from_favorid/{product_id}', 'UserController@delete_product_from_favorid')->middleware(['auth:api', 'scope:user']);

Route::get('get_favorits', 'UserController@get_favorits')->middleware(['auth:api', 'scope:user']);

//////////////////////////////////////////////////////////////// cart  /////////////////////////////

Route::post('add_stack_product_to_cart/{stock_product_id}', 'UserController@add_stack_product_to_cart')->middleware(['auth:api', 'scope:user']);

Route::get('detet_stack_product_from_cart/{cart_id}', 'UserController@detet_stack_product_from_cart')->middleware(['auth:api', 'scope:user']);

Route::get('get_cart', 'UserController@get_cart')->middleware(['auth:api', 'scope:user']);
Route::get('get_cart_details', 'UserController@get_cart_details')->middleware(['auth:api', 'scope:user']);


////////////////////////////////////////////////////////////////////////////////////////////////////
Route::post('add_all_item_in_cart_to_order', 'UserController@add_all_item_in_cart_to_order')->middleware(['auth:api', 'scope:user']);
Route::get('get_order_details', 'UserController@get_order_details')->middleware(['auth:api', 'scope:user']);
Route::get('get_orders', 'UserController@get_orders')->middleware(['auth:api', 'scope:user']);


