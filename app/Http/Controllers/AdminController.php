<?php

namespace App\Http\Controllers;

use App\Models\Admin;
use App\Models\Complaint;
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

    public function ComplaintIndex()
    {
        $complaints = Complaint::query()->where('status' , '=' , 'pending')->get();
        return $this->apiResponse('success',$complaints);
    }

    public function ComplaintResolve(Request $request, Complaint $complaint)
    {
        $validatedData = $request->validate([
            'status' => 'required|in:0,1',
        ]);

        $status = $validatedData['status'] === '1' ? 'resolved' : 'pending';
        $complaint->update(['status' => $status]);

        return $this->apiResponse('Complaint resolved successfully',$complaint);
    }


}
