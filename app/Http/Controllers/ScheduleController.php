<?php

namespace App\Http\Controllers;

use App\Models\Schedule;
use App\Models\Student_classroom;
use App\Models\Subject;
use App\Models\Teacher;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;

class ScheduleController extends Controller
{
    use ApiResponseTrait;

    public function create(Request $request){
        $validatedData = $request->validate([
            'day_number' => ['required','integer'],
            'first_subject'=>['required','integer'],
            'second_subject'=>['required','integer'],
            'third_subject'=>['required','integer'],
            'fourth_subject'=>['required','integer'],
            'fifth_subject'=>['required','integer'],
            'sixth_subject'=>['required','integer'],
            'seventh_subject'=>['nullable','integer'],
        ]);
        $request->validate([
            'room_number'=>['required'],
            'grade_id'=>['required','integer'],
        ]);


        $classroom = DB::table('classrooms')
            ->where('room_number','=',$request->room_number)
            ->where('grade_id','=',$request->grade_id)
            ->first();
        if(!$classroom)
            return $this->apiResponse('classroom not found',null,false);
        $classroom_id=$classroom->classroom_id;

        $validatedData['classroom_id']=$classroom_id;


        $scheduleExists = DB::table('schedules')
            ->where('classroom_id', $classroom_id)
            ->where('day_number', $request->day_number)
            ->exists();

        if($scheduleExists)
            return $this->apiResponse('A schedule already exists for this classroom and day.',null,false);


        $schedule=Schedule::create($validatedData);

        return $this->apiResponse('Created',$schedule);


    }

    public function showClassroomScheduleStudent(Request $request){
        $request->validate([
            //'classroom_id'=>'required',
            'day_number'=>'required',
        ]);
        $user_id=Auth::id();

        $student_id=DB::table('students')
            ->where('user_id','=',$user_id)
            ->first()->student_id;

        $classroom_id=DB::table('students_classrooms')
                     ->where('student_id','=',$student_id)
                     ->first()->classroom_id;



        $data=DB::table('schedules')
            ->where('classroom_id','=',$classroom_id)
            ->where('day_number','=',$request->day_number)
            ->first();

        if(!$data)
            return $this->apiResponse('data not found',null,false);

        $data->first_subject=Subject::find($data->first_subject)->name;
        $data->second_subject=Subject::find($data->second_subject)->name;
        $data->third_subject=Subject::find($data->third_subject)->name;
        $data->fourth_subject=Subject::find($data->fourth_subject)->name;
        $data->fifth_subject=Subject::find($data->fifth_subject)->name;
        $data->sixth_subject=Subject::find($data->sixth_subject)->name;
        $data->seventh_subject=Subject::find($data->seventh_subject)->name;




        return $this->apiResponse('success',$data);



    }


    public function showTeachersSchedule($day_number){
//
        $user_id=Auth::id();

        $teacher=DB::table('teachers')
            ->where('user_id','=',$user_id)
            ->first();




        $data = DB::table('schedules as s')
            ->where(function ($query) use ($day_number){
               $query->where('s.day_number', '=', $day_number);
            })
            ->select('s.classroom_id', 's.day_number', 't.subject_id',
                DB::raw('CONCAT_WS(", ",
            CASE WHEN s.first_subject = ' . $teacher->subject_id . ' THEN "First Period" ELSE NULL END,
            CASE WHEN s.second_subject = ' . $teacher->subject_id . ' THEN "Second Period" ELSE NULL END,
            CASE WHEN s.third_subject = ' . $teacher->subject_id . ' THEN "Third Period" ELSE NULL END,
            CASE WHEN s.fourth_subject = ' . $teacher->subject_id . ' THEN "Fourth Period" ELSE NULL END,
            CASE WHEN s.fifth_subject = ' . $teacher->subject_id . ' THEN "Fifth Period" ELSE NULL END,
            CASE WHEN s.sixth_subject = ' . $teacher->subject_id . ' THEN "Sixth Period" ELSE NULL END,
            CASE WHEN s.seventh_subject = ' . $teacher->subject_id . ' THEN "Seventh Period" ELSE NULL END
            -- Add more clauses for additional subject columns
        ) AS matching_subjects')
            )
            ->join('classrooms as c', 's.classroom_id', '=', 'c.classroom_id')
            ->join('teachers_classrooms as tc', 'c.classroom_id', '=', 'tc.classroom_id')
            ->join('teachers as t', function ($join) use ($teacher) {
                $join->where('s.first_subject', '=', $teacher->subject_id)
                    ->orWhere('s.second_subject', '=', $teacher->subject_id)
                    ->orWhere('s.third_subject', '=', $teacher->subject_id)
                    ->orWhere('s.fourth_subject', '=', $teacher->subject_id)
                    ->orWhere('s.fifth_subject', '=', $teacher->subject_id)
                    ->orWhere('s.sixth_subject', '=', $teacher->subject_id)
                    ->orWhere('s.seventh_subject', '=', $teacher->subject_id);
                // Add more clauses for additional subject columns
            })
            ->where(function ($query) use ($teacher){
                $query->where('t.subject_id', '=',  $teacher->subject_id);
            })
            ->orderBy('s.classroom_id')
            ->groupBy('s.classroom_id', 's.day_number',
                's.first_subject', 's.second_subject', 's.third_subject','s.fourth_subject','s.fifth_subject','s.sixth_subject','s.seventh_subject',
                't.subject_id')
            ->get();









//        $data = DB::table('schedules as s')
//            ->where(function ($query) use ($day_number){
//                $query->where('s.day_number', '=', $day_number);
//            })
//            ->join('teachers as t', 't.teacher_id' , '=' ,$teacher->teacher_id )
//            ->select('s.classroom_id', 's.day_number',
//                DB::raw(
//                    'CONCAT_WS(", ",
//            CASE WHEN s.first_subject = t.subject_id THEN "First Period" ELSE NULL END,
//            CASE WHEN s.second_subject = t.subject_id THEN "Second Period" ELSE NULL END,
//            CASE WHEN s.third_subject = t.subject_id THEN "Third Period" ELSE NULL END,
//            CASE WHEN s.fourth_subject = t.subject_id THEN "Forth Period" ELSE NULL END,
//            CASE WHEN s.fifth_subject = t.subject_id THEN "Fifth Period" ELSE NULL END,
//            CASE WHEN s.sixth_subject = t.subject_id THEN "Sixth Period" ELSE NULL END,
//             CASE WHEN s.seventh_subject = t.subject_id THEN "Seventh Period" ELSE NULL END
//             ) AS matching_subjects')
//
//            )
//            ->join('classrooms as c', 's.classroom_id', '=', 'c.classroom_id')
//            ->join('teachers_classrooms as tc', 'c.classroom_id', '=', 'tc.classroom_id')
////            ->join('teachers as t', function ($join) use ($teacher) {
////                $join->where('s.first_subject', '=', $teacher->subject_id)
////                    ->orWhere('s.second_subject', '=', $teacher->subject_id)
////                    ->orWhere('s.third_subject', '=', $teacher->subject_id)
////                    ->orWhere('s.fourth_subject', '=', $teacher->subject_id)
////                    ->orWhere('s.fifth_subject', '=', $teacher->subject_id)
////                    ->orWhere('s.sixth_subject', '=', $teacher->subject_id)
////                    ->orWhere('s.seventh_subject', '=', $teacher->subject_id);
//
//            ->where(function ($query) use ($teacher) {
//                $query->where('s.first_subject', '=', $teacher->subject_id)
//                    ->orWhere('s.second_subject', '=', $teacher->subject_id)
//                    ->orWhere('s.third_subject', '=', $teacher->subject_id)
//                    ->orWhere('s.fourth_subject', '=', $teacher->subject_id)
//                    ->orWhere('s.fifth_subject', '=', $teacher->subject_id)
//                    ->orWhere('s.sixth_subject', '=', $teacher->subject_id)
//                    ->orWhere('s.seventh_subject', '=', $teacher->subject_id);
//                // Add more clauses for additional subject columns
//            })
//            ->get();











// Map the day of week numbers to their corresponding names
//        $days = [
//            1 => 'Monday',
//            2 => 'Tuesday',
//            3 => 'Wednesday',
//            4 => 'Thursday',
//            5 => 'Friday',
//            6 => 'Saturday',
//            7 => 'Sunday'
//        ];

// Add the day of week names to the schedule data
//        foreach ($data as $item) {
//            $item->day_name = $days[$item->day_of_week];
//        }



        if(!$data)
            return $this->apiResponse('data not found',null,false);



        return $this->apiResponse('success',$data);



    }



    public function index(){
        $teachers = Schedule::all();
        return $this->apiResponse('success',$teachers);
    }

    public function showClassroomSchedule(Request $request){
        $request->validate([
            'room_number'=>['required'],
            'grade_id'=>['required','integer'],
            'day_number'=>['required','integer'],
        ]);

        $classroom = DB::table('classrooms')
            ->where('room_number','=',$request->room_number)
            ->where('grade_id','=',$request->grade_id)
            ->first();

        if(!$classroom)
            return $this->apiResponse('classroom not found',null,false);

        $classroom_id=$classroom->classroom_id;



        $data=DB::table('schedules')
            ->where('classroom_id','=',$classroom_id)
            ->where('day_number','=',$request->day_number)
            ->first();

        if(!$data)
            return $this->apiResponse('data not found',null,false);

        $data->first_subject=Subject::find($data->first_subject)->name;
        $data->second_subject=Subject::find($data->second_subject)->name;
        $data->third_subject=Subject::find($data->third_subject)->name;
        $data->fourth_subject=Subject::find($data->fourth_subject)->name;
        $data->fifth_subject=Subject::find($data->fifth_subject)->name;
        $data->sixth_subject=Subject::find($data->sixth_subject)->name;
        $data->seventh_subject=Subject::find($data->seventh_subject)->name;




        return $this->apiResponse('success',$data);
    }
}
