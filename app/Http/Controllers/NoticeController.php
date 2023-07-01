<?php

namespace App\Http\Controllers;

use App\Models\Attendance;
use App\Models\Notice;
use App\Models\Student;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class NoticeController extends Controller
{
    use ApiResponseTrait;

    public function store(Request $request)
    {
        //

        $validatedData = $request->validate([
            'student_id' => 'required',
            'type' => 'required',
            'content' => 'required',
            'date' => 'required|date',
        ]);

        $notice = Notice::query()->Create($validatedData);

        return $this->apiResponse('Notice sent successfully', $notice);

    }



    public function showforadmin($id)
    {
        $notice = Notice::query()->where('student_id', '=', $id)->get();

        if ($notice->isEmpty()) {
            return $this->apiResponse('Student dont have any notices', null, false);
        }


        return $this->apiResponse('success', $notice);
    }

    public function showforstudent()
    {
        $student_id = Student::query()->where('user_id' , '=' , Auth::id())->first()->student_id;
        $notice= Notice::query()->where('student_id' , '=' , $student_id)->get();
        if ($notice->isEmpty())
            return $this->apiResponse('You do not have any notices',null,false);

        return $this->apiResponse('success', $notice);
    }


    public function showforparent($id)
    {
        $notice= Notice::query()->where('student_id' , '=' , $id)->get();

        if ($notice->isEmpty())
            return $this->apiResponse('Your son do not have any notices',null,false);

        return $this->apiResponse('success', $notice);
    }
}
