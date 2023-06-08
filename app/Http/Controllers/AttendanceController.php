<?php

namespace App\Http\Controllers;

use App\Models\Attendance;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;

class AttendanceController extends Controller
{
    //
    use ApiResponseTrait;
    public function store(Request $request)
    {
        //

        $validatedData = $request->validate([
            'student_id' => 'required|array',
            'date' => 'required|date',
        ]);

        $student_ids = $validatedData['student_id'];
        $date = $validatedData['date'];


        foreach ($student_ids as $student_id) {
            $attend = Attendance::query()->Create([
                'student_id' => $student_id,
                'date' => $date,
            ]);
        }


        return $this->apiResponse('Attendance created successfully', $attend);


    }




    /*public function showforadmin($id)
    {

        $attend = Attendance::query()->where('student_id' , '=' , $id)->get();


        if (!$attend)
            return $this->apiResponse('Student did not absent',null,false);

       return $this->apiResponse('success', $attend);
    }*/
    public function showforadmin($id)
    {
        $attend = Attendance::query()->where('student_id', '=', $id)->get();

        if ($attend->isEmpty()) {
            return $this->apiResponse('Student did not absent', null, false);
        }


        return $this->apiResponse('success', $attend);
    }

    public function showforstudent($id)
    {
        $student_id=Auth::id();
        $attend= Attendance::query()->where('student_id' , '=' , $id)->get();;
        if ($attend->isEmpty())
            return $this->apiResponse('You did not absent',null,false);

        return $this->apiResponse('success', $attend);
    }





}
