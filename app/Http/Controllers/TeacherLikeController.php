<?php

namespace App\Http\Controllers;

use App\Models\TeacherLike;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;

class TeacherLikeController extends Controller
{
    use ApiResponseTrait;
    public function store(Request $request ,$post_id)

    {
        $post_id=$request->post_id;

        $teacher_id=Auth::id();

        return $this->apiResponse('',$teacher_id);

        if (DB::table('teachers_likes')->where('teacher_id', '=', Auth::id())->where('post_id', '=', $post_id)->exists()) {
            DB::table('teachers_likes')
                ->where('teacher_id', '=', Auth::id())
                ->where('post_id', '=', $post_id)
                ->delete();
            return $this->apiResponse('like deleted');
        } else {
            DB::table('teachers_likes')->insert([
                'post_id' => $post_id,
                'teacher_id' => Auth::id()
            ]);
            return $this->apiResponse('like created');

        }
    }
}
