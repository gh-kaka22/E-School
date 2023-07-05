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
