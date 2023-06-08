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
        $students = Student::all();
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

        $data=$request->all();
        $student=Student::find($student_id);

        if(!$student)
         return $this->apiResponse('Student not found',null,false);

        $student->update($data);
        return $this->apiResponse('success',$student);





//        $student = Student::find($id);
//        $student = Student::query()->where('id', '=', $id)->update(
//            [
//                'first_name' => $request->has('first_name') ? $request['first_name'] : $student['first_name'],
//                'last_name' => $request->has('last_name') ? $request['last_name'] : $student['last_name'],
//                'date_of_birth' => $request->has('date_of_birth') ? $request['date_of_birth'] : $student['date_of_birth'],
//                'father_name' => $request->has('father_name') ? $request['father_name'] : $student['father_name'],
//                'father_phone_number' => $request->has('father_phone_number') ? $request['father_phone_number'] : $student['father_phone_number'],
//                'mother_first_name' => $request->has('mother_first_name') ? $request['mother_first_name'] : $student['mother_first_name'],
//                'mother_last_name' => $request->has('mother_last_name') ? $request['mother_last_name'] : $student['mother_last_name'],
//                'mother_phone_number' => $request->has('mother_phone_number') ? $request['mother_phone_number'] : $student['mother_phone_number'],
//                'religion' => $request->has('religion') ? $request['religion'] : $student['religion'],
//                'address' => $request->has('address') ? $request['address'] : $student['address'],
//                'grade_number' => $request->has('grade_number') ? $request['grade_number'] : $student['grade_number'],
//                'details' => $request->has('details') ? $request['details'] : $student['details'],
//                'have_kids' => $request->has('have_kids') ? $request['have_kids'] : $student['have_kids'],
//                'father_id' => $request->has('father_id') ? $request['father_id'] : $student['father_id'],
//                'mother_id' => $request->has('mother_id') ? $request['mother_id'] : $student['mother_id'],
//                'gender_id' => $request->has('gender_id') ? $request['gender_id'] : $student['gender_id'],
//
//            ]);
//        //$school = School::query()->get();
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
            ->where('grade_id','=',$grade_id)
            ->get();

        return $this->apiResponse('success',$students);
    }


    public function showProfile(){
        $student_id=Auth::id();
        if(!$student_id)
            return $this->apiResponse('Student not found',null,false);

        $student=DB::table('students')
            ->where('student_id','=',$student_id)
            ->first();

        $parents=DB::table('parents')
        ->where('parent_id','=',$student->parent_id)
        ->first();

        $classroom=DB::table('students_classrooms')
            ->where('student_id','=',$student_id)
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



        $student->father_first_name=$parents->father_first_name;
        $student->father_phone_number=$parents->father_phone_number;
        $student->mother_first_name=$parents->mother_first_name;
        $student->mother_last_name=$parents->mother_last_name;
        $student->mother_phone_number=$parents->mother_phone_number;





        return $this->apiResponse('success',$student);
    }

    public function showHome(){
        $student_id=Auth::id();
        $student=DB::table('students')
            ->where('student_id','=',$student_id)
            ->first();


        $classroom=DB::table('students_classrooms')
            ->where('student_id','=',$student_id)
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

}
