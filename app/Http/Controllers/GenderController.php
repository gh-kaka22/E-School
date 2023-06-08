<?php

namespace App\Http\Controllers;

use App\Models\Gender;
use Illuminate\Http\Request;
use Illuminate\Http\Response;
use Illuminate\Http\JsonResponse;

class GenderController extends Controller
{
    use ApiResponseTrait;

    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\JsonResponse
     */
    public function index()
    {
        $genders = Gender::all();

        if(!$genders)
            return $this->apiResponse('Gender not found',null,false);
        return $this->apiResponse('success',$genders);


    }


    public function store(Request $request)
    {
        $gender = new Gender;
        $gender->name = $request->name;
        $gender->save();

        return $this->apiResponse('Gender created successfully',$gender);


    }


    public function show($id)
    {

        $gender = Gender::find($id);
        if(!$gender)
            return $this->apiResponse('Gender not found',null,false);
        return $this->apiResponse('success',$gender);
    }


    public function update(Request $request, $id)
    {
        $gender = Gender::findOrFail($id);
        $gender->name = $request->name;
        $gender->save();

        if(!$gender)
            return $this->apiResponse('Gender not found',null,false);
        return $this->apiResponse('Gender updated successfully',$gender);


    }


    public function destroy($id)
    {
        $gender = Gender::find($id);

        if(!$gender)
            return $this->apiResponse('Gender not found',null,false);

        $gender->delete();
        return $this->apiResponse('Gender deleted successfully',$gender);

    }
}
