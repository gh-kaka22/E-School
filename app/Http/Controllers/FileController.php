<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Storage;

class FileController extends Controller
{
    use  ApiResponseTrait;
    public function upload(Request $request)
    {

        $request->validate([
            'name' => 'required|string',
            'classroom_id'=> 'required|integer',
            'pdf_file' => 'required|file|mimes:pdf|max:2048',


        ]);

        $path = 'files';
        if ($request->hasFile('pdf_file')) {
            $fileName =$request->name . '.' . $request->pdf_file->extension();
            $request->pdf_file->move($path,$fileName);
            //$path = $file->storeAs('files', $fileName, 'public');

            $insertedId = DB::table('files')->insertGetId([
                'name' => $fileName,
                'path' => $path,
                'classroom_id' =>$request->classroom_id
            ]);

            $insertedData = DB::table('files')->where('id', $insertedId)->first();


            return $this->apiResponse('File uploaded successfully',$insertedData);
        }
        return $this->apiResponse('No file uploaded',null,false);
    }

    public function show($fileName)
    {
        $filePath = 'files/' . $fileName;
//        $fullPath = Storage::disk('public')->path($filePath);
//        $permissions = fileperms($fullPath);


        if (Storage::disk('public')->exists($filePath)) {
            $fileContents = Storage::disk('public')->get($filePath);




            return $this->apiResponse('success',$fileContents);
        }

        // File not found, return a response indicating it
        return $this->apiResponse('not found',$filePath);

    }
}
