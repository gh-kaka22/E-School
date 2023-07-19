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

    public function getStatistics()
    {


        $statistics['admins']=DB::table('admins')->count();
        $statistics['teachers']=DB::table('teachers')->count();
        $statistics['students']=DB::table('students')->count();
        $statistics['employees']=DB::table('employees')->count();

        return $this->apiResponse('success',$statistics);

    }

    public function show(Request $request)
    {
        $admin = Admin::find($request->id);
        if(!$admin)
            return $this->apiResponse('admin not found',null,false);
        return $this->apiResponse('success',$admin);

    }




}
