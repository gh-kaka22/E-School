<?php

namespace App\Http\Controllers;

use App\Models\Exam;
use App\Notifications\ExamResult;
use Illuminate\Http\Request;
use Carbon\Carbon;
use Illuminate\Support\Facades\DB;

class ExamController extends Controller
{
    use ApiResponseTrait;
     public function store(Request $request){
         $validatedData=$request->validate([
             'student_id'=>['required','integer'],
             'subject_name'=>['required','string'],
             'type_id'=>['required','integer'],
             'mark'=>['required'],
             'date'=>['required','date','date_format:Y-m-d'],
             'schoolyear'=>['required'],
         ]);
            $subject_id=DB::table('subjects')
                ->where('name','=',$request->subject_name)
                ->first()
                ->subject_id;

         $subject_max_mark=DB::table('subjects')
             ->where('name','=',$request->subject_name)
             ->first()
             ->max_mark;

         if($request->mark>$subject_max_mark)
             return $this->apiResponse('The mark you entered is greater than the max mark',null,false);
//         $dateString = $request->date;
//         $date = Carbon::createFromFormat('Y-m-d', $dateString);
//         $monthNumber = $date->format('m');
//         $examExists = DB::table('exams')
//             ->where('student_id', $request->student_id)
//             ->where('subject_id', $subject_id)
//             ->where('type_id','=',$request->type_id)
//             ->exists();
//
//         if($examExists)
//             return $this->apiResponse('The student already have an exam with this subject and type registerd',null,false);

         $exam=Exam::create([
             'student_id'=>$request->student_id,
             'subject_id'=>$subject_id,
             'type_id'=>$request->type_id,
             'mark'=>$request->mark,
             'date'=>$request->date,
             'schoolyear'=>$request->schoolyear
         ]);


         return $this->apiResponse('success',$exam);



     }

     public function showForAdmin(Request $request){
         $request->validate([
             'grade_id'=>['required','integer'],
             'room_number'=>['required','string'],
             'subject_name'=>['required','string'],
             'type_id'=>['required','integer'],
             'schoolyear'=>['required'],
         ]);

         $student_ids=DB::table('students_classrooms')
             ->join('classrooms','students_classrooms.classroom_id','=','classrooms.classroom_id')
             ->where('classrooms.grade_id','=',$request->grade_id)
             ->where('classrooms.room_number','=',$request->room_number)
             ->pluck('students_classrooms.student_id');

         if ($student_ids->isEmpty())
             return $this->apiResponse('No students in the classroom you entered',null,false);




         $marks=DB::table('exams')
             ->whereIn('student_id',$student_ids)
             ->get();

         if ($marks->isEmpty())
             return $this->apiResponse('No marks for the following classroom',null,false);
         return $this->apiResponse('success',$marks);

     }

     public function showForStudent($id){
        $res= DB::table('exams')
             ->whereMonth('date','=',$id)
             ->first();

         return $this->apiResponse('s',$res);

     }

}
