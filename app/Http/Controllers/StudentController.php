<?php

namespace App\Http\Controllers;

use App\Http\Controllers\Controller;
use App\Models\Student;
use App\Models\Teacher;
use Illuminate\Http\Request;
use App\Models\Subject;
use Illuminate\Http\Response;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;

class StudentController extends Controller
{
    use ApiResponseTrait;

    public function index()
    {
        //$students = Student::all();
        $students = DB::table('students')
            ->join('users', 'students.user_id', '=', 'users.id')
            ->join('students_classrooms', 'students.student_id', '=', 'students_classrooms.student_id')
            ->join('classrooms', 'students_classrooms.classroom_id', '=', 'classrooms.classroom_id')
            ->select('students.*', 'users.email', 'classrooms.room_number')
            ->get();
        return $this->apiResponse('success', $students);
    }


    public function show($student_id)
    {
        $student = Student::find($student_id);
        if (!$student)
            return $this->apiResponse('Student not found',null,false);
        return $this->apiResponse('success', $student);
    }


    public function update(Request $request,$student_id)
    {
//
        $data=$request->all();
        $student=Student::find($student_id);

        if(!$student)
         return $this->apiResponse('Student not found',null,false);

        $student->update($data);
        return $this->apiResponse('success',$student);

        ///عمرين اذا بقى بتعمل شي راوت put لا تلوم الا حالك وقد أعذر من أنذر
        ///
        ///
        ///
        ///
        ///
        ///
//
//        $request->validate([
//            'first_name' => [ 'max:55', 'string' ,'nullable'],
//            'last_name' => [ 'max:55', 'string','nullable'],
//            'date_of_birth'=>[ 'date','date_format:Y-m-d','nullable'],
//            'religion' => [ 'max:55', 'string','nullable'],
//            'address'=>[ 'string','nullable'],
//            //'grade_number'=>['required', 'max:12', 'integer'],
//            //'status' => $request->has('status') ? $request['status'] : $student['status'],
//            'details' => ['nullable'],
//            'parent_id'=>['nullable','integer'],
//            'gender_id'=>['integer'],
//
//        ]);
//
//
//
//
//        $student = Student::find($student_id);
//
//        $student= Student::query()->find($student_id)->update(
//            [
//                'first_name' => $request->has('first_name') ? $request['first_name'] : $student['first_name'],
//                'last_name' => $request->has('last_name') ? $request['last_name'] : $student['last_name'],
//                'date_of_birth' => $request->has('date_of_birth') ? $request['date_of_birth'] : $student['date_of_birth'],
//                'religion' => $request->has('religion') ? $request['religion'] : $student['religion'],
//                'address' => $request->has('address') ? $request['address'] : $student['address'],
//                //'grade_id' => $request->has('grade_number') ? $request['grade_number'] : $student['grade_number'],
//                'details' => $request->has('details') ? $request['details'] : $student['details'],
//                'parent_id' => $request->has('parent_id') ? $request['parent_id'] : $student['parent_id'],
//                //'status' => $request->has('status') ? $request['status'] : $student['status'],
//                'gender_id' => $request->has('gender_id') ? $request['gender_id'] : $student['gender_id'],
//
//            ]);
//
//
//        $student = Student::query()->where('student_id', '=', $student_id)->first();
//
//        if (!$student)
//            return $this->apiResponse('Student not found',null,false);
//        return $this->apiResponse('Student updated successfully', $student);

    }


    public function destroy($id)
    {
        $student = Student::find($id);
        if (!$student)
            return $this->apiResponse('Student not found',null,false);

        $student->delete();
        return $this->apiResponse('Student deleted successfully', $student);
    }


    public function getStudentCount()
    {
        $studentCount = DB::table('students')->count();
        return $studentCount;
    }


    public function searchByName(Request $request)
    {
        $attributes = $request->validate([
            'first_name' => ['required', 'max:55', 'string'],
            'last_name' => ['required', 'max:55', 'string'],
        ]);

        $student = DB::table('students')
            ->where('first_name', '=', $request->first_name)
            ->orWhere('last_name', '=', $request->last_name)
            ->get();


        return $this->apiResponse('success', $student);


    }


    public function showByGrade($grade_id){
        $students=DB::table('students')
            ->where('students.grade_id','=',$grade_id)
            ->join('users', 'students.user_id', '=', 'users.id')
            ->join('students_classrooms', 'students.student_id', '=', 'students_classrooms.student_id')
            ->join('classrooms', 'students_classrooms.classroom_id', '=', 'classrooms.classroom_id')
            ->select('students.*', 'users.email', 'classrooms.room_number')
            ->get();

        return $this->apiResponse('success',$students);
    }


    public function showProfile(){
        $user_id=Auth::id();
        $user=Auth::user();



        $student=DB::table('students')
            ->where('user_id','=',$user_id)
            ->first();



        $parents=DB::table('parents')
        ->where('parent_id','=',$student->parent_id)
        ->first();

        $classroom=DB::table('students_classrooms')
            ->where('student_id','=',$student->student_id)
            ->first();
        if(!$classroom)
            $student->classroom='Not assigned';
        else {
            $classroom_id=$classroom->classroom_id;

            $classroom_name=DB::table('classrooms')
                ->where('classroom_id','=',$classroom_id)
                ->first()->room_number;

            $student->classroom=$classroom_name;
        }

        $student->email=$user->email;
        $student->father_first_name=$parents->father_first_name;
        $student->father_phone_number=$parents->father_phone_number;
        $student->mother_first_name=$parents->mother_first_name;
        $student->mother_last_name=$parents->mother_last_name;
        $student->mother_phone_number=$parents->mother_phone_number;





        return $this->apiResponse('success',$student);
    }

    public function showHome(){
        $user_id=Auth::id();
        $student=DB::table('students')
            ->where('user_id','=',$user_id)
            ->first();


        $classroom=DB::table('students_classrooms')
            ->where('student_id','=',$student->student_id)
            ->first();
        if(!$classroom)
            $student->classroom='Not assigned';
        else {
            $classroom_id=$classroom->classroom_id;

            $classroom_name=DB::table('classrooms')
                ->where('classroom_id','=',$classroom_id)
                ->first()->room_number;

            $student->classroom=$classroom_name;
        }

        return $this->apiResponse('Success',$student);
    }

    public function showByClassroom(Request $request){

        $request->validate([
            'room_number'=>['required'],
            'grade_id'=>['required']
        ]);

        $classroom=DB::table('classrooms')
            ->where('grade_id','=',$request->grade_id)
            ->where('room_number','=',$request->room_number)
            ->first();

        if($classroom){
            $classroom_id=$classroom->classroom_id;

            $students_classrooms= DB::table('students_classrooms')
                ->where('classroom_id','=',$classroom_id)
                ->get();

            $students_ids=array();

            foreach ($students_classrooms as $object){
                array_push($students_ids,$object->student_id);
            }

            $students = DB::table('students')
                ->whereIn('students.student_id', $students_ids)
                ->join('users', 'students.user_id', '=', 'users.id')
                ->join('students_classrooms', 'students.student_id', '=', 'students_classrooms.student_id')
                ->join('classrooms', 'students_classrooms.classroom_id', '=', 'classrooms.classroom_id')
                ->select('students.*', 'users.email', 'classrooms.room_number')
                ->get();



            return $this->apiResponse('success',$students);


        }


        return $this->apiResponse('The classroom does not exist',null,false);




    }

}
