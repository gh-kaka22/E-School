<?php

namespace App\Http\Controllers;

use App\Models\Admin;
use Illuminate\Http\Request;

class AdminController extends Controller
{
    //
    use ApiResponseTrait;

    public function index()
    {
        $admins = Admin::all();
        return $this->apiResponse('success',$admins);
    }

    public function show(Request $request)
    {
        $admin = Admin::find($request->id);
        if(!$admin)
            return $this->apiResponse('admin not found',null,false);
        return $this->apiResponse('success',$admin);

    }




}
