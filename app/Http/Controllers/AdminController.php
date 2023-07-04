<?php

namespace App\Http\Controllers;

use App\Models\Admin;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class AdminController extends Controller
{
    //
    use ApiResponseTrait;

    public function index()
    {
        $admins = Admin::all();
        return $this->apiResponse('success',$admins);
    }

    public function getAdminCount()
    {
        $adminCount = DB::table('admins')->count();
        return $adminCount;
    }

    public function show(Request $request)
    {
        $admin = Admin::find($request->id);
        if(!$admin)
            return $this->apiResponse('admin not found',null,false);
        return $this->apiResponse('success',$admin);

    }




}
