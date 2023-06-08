<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\School;

class SchoolController extends Controller
{
    use ApiResponseTrait;


    /**
     * Display a listing of the resource.
     */

    public function index()
    {
        //
//        $school = School::all();
//        return $this->apiResponse('success',$school);


    }


    /**
     * Store a newly created resource in storage.
     */

    public function store(Request $request)
    {
        //

        $request->validate([
            'name' => ['required', 'max:55', 'string'],
            'address' => ['required', 'string'],
            'overview' => ['required' , 'string'],
            'phone' => ['required','min:10', 'max:14', 'string'],

        ]);

        $school= School::query()->Create([
            'name' => $request->name,
            'address' => $request->address,
            'phone' => $request->phone,
            'overview' => $request->overview,
        ]);


        return $this->apiResponse('The School created successfully',$school);

    }

    /**
     * Display the specified resource.
     */

    public function show(string $id)
    {
        //
        $school = School::find($id);

        if(!$school)
            return $this->apiResponse('School not found');

        return $this->apiResponse('success',$school);

    }


    /**
     * Update the specified resource in storage.
     */

    public function update(Request $request, string $id)
    {
        //

        $school = School::find($id);
        $school = School::query()->where('id', '=', $id )->update(
            [
            'name' => $request->has('name') ? $request['name'] : $school['name'],
            'address' => $request->has('address') ? $request['address'] : $school['address'],
            'overview' => $request->has('overview') ? $request['overview'] : $school['overview'],
            'phone' => $request->has('phone') ? $request['phone'] : $school['phone'],
            ]);

        //$school = School::query()->get();
        if(!$school)
            return $this->apiResponse('School not found');
        return $this->apiResponse('School updated successfully',$school);
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(string $id)
    {
        //
        $school = School::find($id);
        if(!$school)
            return $this->apiResponse('School not found');
        $school->delete();
        return $this->apiResponse('School deleted successfully',$school);

    }
}
