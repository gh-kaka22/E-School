<?php

namespace App\Http\Controllers;

use App\Models\Post;
use App\Models\StudentLike;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;

class StudentLikeController extends Controller
{
    use ApiResponseTrait;
    // show all likes
//    public function index(Request $request ,$id)
//    {
//        $product = Post::find($id);
//        $likes = $product->studentLike()->get();
//        return $this->apiResponse('s',$likes);
//    }

    public function store($post_id)

    {


        if(DB::table('students_likes')->where('student_id','=',Auth::id())->where('post_id','=',$post_id)->exists())
        {
            DB::table('students_likes')
                ->where('student_id','=',Auth::id())
                ->where('post_id','=',$post_id)
                ->delete();
            return  $this->apiResponse('like deleted');
        }
        else
        {
            DB::table('students_likes')->insert([
                'post_id'=>$post_id,
                'student_id'=>Auth::id()
            ]);
            return  $this->apiResponse('like created');

        }
    }
}
