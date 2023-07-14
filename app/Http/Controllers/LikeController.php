<?php

namespace App\Http\Controllers;

use App\Models\Post;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class LikeController extends Controller
{
    use ApiResponseTrait;
    public function index(Request $request ,$post_id)
    {      $post = Post::find($post_id);
        $likes = $post->likes()->get();
        return $this->apiResponse('success',$likes);
    }

    public function store(Request $request ,$post_id)

    {
        $post = Post::find($post_id);
        if($post->likes()->where('user_id',Auth::id())->exists())
        {
            $post->likes()->where('user_id',Auth::id())->delete();
            return $this->apiResponse('unliked',count($post->likes));
        }
        else
        {

            $post->likes()->create(['user_id'=>Auth::id()]);
            return $this->apiResponse('liked',count($post->likes));
        }


    }
}
