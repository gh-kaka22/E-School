<?php

namespace App\Http\Controllers;

use App\Models\Schedule;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Models\Teacher;
use Illuminate\Http\Response;
use Illuminate\Support\Facades\DB;

class TeacherController extends Controller
{
    use ApiResponseTrait;

    public function index()
    {
        $teachers = Teacher::all();

        return $this->apiResponse('success',$teachers);
    }



    /*
     *
      public function store(Request $request)
    {
        $validatedData = $request->validate([
            'first_name' => ['required','string','max:255'],
            'last_name' => ['required','string','max:255'],
            'phone_number' => ['required','string','min:10','max:10'],
            'address' => ['required','string','max:255'],
            'subject_id' => ['required','integer']
        ]);

        $request->validate([
            'classrooms' => ['required', 'array', 'min:1', 'max:10']
        ]);

        $teacher = Teacher::create($validatedData);

        return $this->apiResponse('success',$teacher);
    }
     *
     */


    public function show(Request $request)
    {
        $teacher = Teacher::find($request->id);
         if(!$teacher)
             return $this->apiResponse('Teacher not found',null,false);

        $teacher['subject_name'] = DB::table('subjects')
            ->where('subject_id', '=', $teacher->subject_id)
            ->first()->name;

        $classrooms = DB::table('teachers_classrooms')
            ->where('teacher_id', '=', $teacher->teacher_id)
            ->get();


        $teacher['classrooms'] = collect($classrooms)->pluck('classroom_id')->toArray();

        return $this->apiResponse('success',$teacher);

    }

    public function update(Request $request, $id)
    {
        $validatedData = $request->validate([
            'first_name' => ['nullable','string','max:255'],
            'last_name' => ['nullable','string','max:255'],
            'phone_number' => ['nullable','string','min:10','max:10'],
            'address' => ['nullable','string','max:255'],
            'details' => 'nullable',
            'subject_id' => ['nullable','integer']
        ]);

        $teacher = Teacher::find($id);
        if(!$teacher)
            return $this->apiResponse('Teacher not found',null,false);
        $teacher->update($validatedData);

        return $this->apiResponse('success',$teacher);
    }

    public function destroy($id)
    {
        $teacher = Teacher::find($id);
        if(!$teacher)
            return $this->apiResponse('Teacher not found',null,false);
        $teacher->delete();

        return $this->apiResponse('success',$teacher);
    }


    public function getTeacherCount()
    {
        $teacherCount = DB::table('teachers')->count();
        return $teacherCount;
    }

    public function subjectTeacher($id){
        $teachers = DB::table('teachers')
          ->where('subject_id','=',$id)
          ->get();

        return $this->apiResponse('success',$teachers);

    }

    public  function searchByName(Request $request) {
        $name = $request->name;

        //$teachers= Teacher::where('first_name', 'like', "$name%")->get();

        $teachers = DB::table('teachers')
            ->where('teachers.first_name', 'LIKE', "$name%")
            ->orWhere('teachers.last_name', 'LIKE', "$name%")
            ->get();
        return $this->apiResponse('success',$teachers);
    }








}






