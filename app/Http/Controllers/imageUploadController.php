<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

class imageUploadController extends Controller
{
    /**
     * Display the view of the resources.
     *
     * @return \Illuminate\Http\Response
     */
    public function imageUpload(Request $request)
    {
        $target_input=$request->target_input;
        $target_img=$request->target_img;
        $arr = Array('target_input' => $target_input, 'target_img' =>$target_img);
        return view('imageUpload',$arr);
    }

    /**
     * Store the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function imageUploadPost(Request $request)
    {


      
        $imageName = time() . '.' . request()->image->getClientOriginalExtension();

        request()->image->move(public_path('images'), $imageName);

        return back()->with('success', 'You have successfully upload image.')->with('image', $imageName);
    }
}
