<?php

namespace App\Http\Controllers;

use App\Models\ParentLike;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;

class ParentLikeController extends Controller
{
    public function store($post_id)

    {


        if (DB::table('parents_likes')->where('parent_id', '=', Auth::id())->where('post_id', '=', $post_id)->exists()) {
            DB::table('parents_likes')
                ->where('parent_id', '=', Auth::id())
                ->where('post_id', '=', $post_id)
                ->delete();
            return $this->apiResponse('like deleted');
        } else {
            DB::table('parents_likes')->insert([
                'post_id' => $post_id,
                'parent_id' => Auth::id()
            ]);
            return $this->apiResponse('like created');

        }
    }
}
