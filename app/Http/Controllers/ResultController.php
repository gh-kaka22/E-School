<?php

namespace App\Http\Controllers;

use App\Models\Result;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class ResultController extends Controller
{
    use ApiResponseTrait;
    public function calcResForGrade($grade_id){

//       Calc each subject for each student
//        $students = DB::table('students')
//                  ->where('students.grade_id','=',$grade_id)
//                  ->where('students.status','=','active')
//                  ->join('exams','students.student_id','=','exams.student_id')
//                  ->join('subjects','subjects.subject_id','=','exams.subject_id')
//                  ->select('students.student_id','subjects.name','students.first_name','students.last_name', DB::raw('AVG(exams.mark) as average'))
//                  ->groupBy('students.student_id','subjects.name','students.first_name','students.last_name')
//                  ->get();


        $students = DB::table('students')
            ->where('students.grade_id','=',$grade_id)
            ->where('students.status','=','active')
            ->join('exams','students.student_id','=','exams.student_id')
            ->join('subjects','subjects.subject_id','=','exams.subject_id')
            ->select('students.student_id','students.first_name','exams.schoolyear','students.last_name', DB::raw('AVG(exams.mark) as average'))
            ->groupBy('students.student_id','students.first_name','students.last_name','exams.schoolyear')
            ->get();

        foreach ($students as $student) {
            Result::updateOrCreate(
                ['student_id' => $student->student_id, 'schoolyear' => $student->schoolyear],
                ['result' => $student->average, 'grade_id' => $grade_id]
            );
        }


        return $this->apiResponse('success',$students);

    }
}
