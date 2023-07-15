<?php

namespace App\Http\Controllers;

use App\Models\Student_classroom;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class StudentClassroomController extends Controller
{
    use ApiResponseTrait;

    //Testing ONLY. Do not take it seriously
    public function create(Request $request){
        $exists = DB::table('students_classrooms')
            ->where('classroom_id', $request->classroom_id)
            ->where('student_id', $request->student_id)
            ->exists();

        if($exists)
            return $this->apiResponse('The student already assigned for a classroom',null,false);

        $res=Student_classroom::create([
            'student_id'=>$request->student_id,
            'classroom_id'=>$request->classroom_id,
        ]);



        return $this->apiResponse('s',$res);
    }
}