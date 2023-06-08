<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class ParenttController extends Controller
{
    use ApiResponseTrait;
    public function search(Request $request){
//
        $name=$request->name;
        $parents=DB::table('parents')
            ->where('father_first_name','like',"$name%")
            ->orWhere('father_last_name','like',"$name%")
            ->orWhere('mother_first_name','like',"$name%")
            ->orWhere('mother_last_name','like',"$name%")
            ->first();

        return $this->apiResponse('success',$parents);
    }

}
