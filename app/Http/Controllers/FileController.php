<?php

namespace App\Http\Controllers;

use App\Models\File;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Storage;

class FileController extends Controller
{
    use  ApiResponseTrait;
    public function upload(Request $request)
    {

        $request->validate([
            'name' => ['required','string'],
            'room_number'=>['required'],
            'grade_id'=>['required','integer'],
            'pdf_file' => 'required|file|mimes:pdf|max:2048',


        ]);
        $classroom = DB::table('classrooms')
            ->where('room_number','=',$request->room_number)
            ->where('grade_id','=',$request->grade_id)
            ->first();
        if(!$classroom)
            return $this->apiResponse('classroom not found',null,false);
        $classroom_id=$classroom->classroom_id;

        $path = 'files';
        if ($request->hasFile('pdf_file')) {
            $fileName =$request->name . '.' . $request->pdf_file->extension();
            $request->pdf_file->move($path,$fileName);
            //$path = $file->storeAs('files', $fileName, 'public');



            $insertedData = File::create([
                'name' => $fileName,
                'path' => "localhost:8000/files/{$fileName}",
                'classroom_id' =>$classroom_id

            ]);


            return $this->apiResponse('File uploaded successfully',$insertedData);
        }
        return $this->apiResponse('No file uploaded',null,false);
    }

    public function showForClassroom(Request $request)
    {
       $request->validate([
           'room_number'=>['required'],
           'grade_id'=>['required','integer']
       ]);

       $classroom = DB::table('classrooms')
           ->where('room_number','=',$request->room_number)
           ->where('grade_id','=',$request->grade_id)
           ->first();
       if(!$classroom)
           return $this->apiResponse('classroom not found',null,false);
        $classroom_id=$classroom->classroom_id;
        $file=DB::table('files')
            ->where('classroom_id','=',$classroom_id)
            ->get();

        return $this->apiResponse('success',$file);


    }
}
